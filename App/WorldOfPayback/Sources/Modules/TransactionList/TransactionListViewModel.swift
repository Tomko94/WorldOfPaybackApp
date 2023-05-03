//
//  TransactionListViewModel.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation
import SwiftUIArch

internal protocol TransactionListViewModelType: ViewModelLayerType, ObservableObject {
    var header: TransactionListHeaderView.Model { get }
    var transactions: [TransactionListItemView.Model] { get }
}

internal final class TransactionListViewModel: ViewModelLayer<TransactionListNavigator>, TransactionListViewModelType {
    // MARK: - Internal Published Properties

    @Published internal var header = TransactionListHeaderView.Model()
    @Published internal var transactions: [TransactionListItemView.Model] = []

    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private var transactionsEntity: [TransactionEntity]?
    private var bag = Set<AnyCancellable>()
    private var actionBag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(navigator: TransactionListNavigator, _ serviceProvider: ServiceProviderType = ServiceProvider()) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }

    override func initialize() {
        prepareModel()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Action
// -----------------------------------------------------------------------------

extension TransactionListViewModel {
    private func transactionSelected(transactionEntity: TransactionEntity) {
        navigator.pushTransactionDetailsView(transactionEntity: transactionEntity)
    }

    private func filterItems(byCategory category: Int?) {
        guard let transactionsEntity else { return }
        let filteredTransaction = transactionsEntity.filter {
            category == nil || $0.category == category
        }
        let filteredTransactionSum = filteredTransaction.map(\.transactionDetail.value.amount).reduce(0) { $0 + $1 }
        transactions = filteredTransaction.map(mapTransactionItem)
        header.transactionsSum = "\(filteredTransactionSum)"
    }
}

// -----------------------------------------------------------------------------
// MARK: - Prepare Model
// -----------------------------------------------------------------------------

extension TransactionListViewModel {
    private func prepareModel() {
        serviceProvider
            .transactionService()
            .getTransactionList()
            .map(\.items)
            .sink(receiveCompletion: {
                switch $0 {
                case let .failure(error): print(error)
                case .finished: return
                }
            }, receiveValue: { [weak self] in
                self?.prepareModel($0)
            })
            .store(in: &bag)
    }

    private func prepareModel(_ transactions: [TransactionEntity]) {
        transactionsEntity = transactions
        self.transactions = transactions.map(mapTransactionItem)
        prepareHeader(transactions)
    }

    private func prepareHeader(_ transactions: [TransactionEntity]) {
        var categories: [Int?] = Array(Set(transactions.map(\.category))).sorted()
        categories.insert(nil, at: 0)

        let transactionSum = transactions.map(\.transactionDetail.value.amount).reduce(0) { $0 + $1 }
        let header = TransactionListHeaderView.Model(
            transactionsSumTitle: "Transactions value",
            transactionsSum: "\(transactionSum)",
            filterLabel: "Category",
            categories: categories
        )

        header.$category
            .sink { [weak self] in
                self?.filterItems(byCategory: $0)
            }
            .store(in: &actionBag)

        self.header = header
    }

    private func mapTransactionItem(_ transaction: TransactionEntity) -> TransactionListItemView.Model {
        let item = TransactionListItemView.Model(transaction)

        item.action
            .sink { [weak self] in
                self?.transactionSelected(transactionEntity: transaction)
            }
            .store(in: &actionBag)

        return item
    }
}
