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
    var title: String { get }
    var header: TransactionListHeaderView.Model { get }
    var transactions: [TransactionListItemView.Model] { get }
    var toastController: ToastController.Model { get }
}

internal final class TransactionListViewModel: ViewModelLayer<TransactionListNavigator>, TransactionListViewModelType {
    // MARK: - Internal Published Properties

    @Published internal var title = Translations.localizedString("TransactionListTitle")
    @Published internal var header = TransactionListHeaderView.Model()
    @Published internal var transactions: [TransactionListItemView.Model] = []
    @Published internal var toastController = ToastController.Model()

    // MARK: - Private Properties

    private let serviceProvider: ServiceProviderType
    private var transactionsEntity: [TransactionEntity]?
    private var modelBag = Set<AnyCancellable>()
    private var actionBag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(navigator: TransactionListNavigator, serviceProvider: ServiceProviderType = ServiceProvider()) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)
    }

    override func initialize() {
        loadModel()
    }
}

// -----------------------------------------------------------------------------
// MARK: - Action
// -----------------------------------------------------------------------------

extension TransactionListViewModel {
    private func transactionSelected(transactionEntity: TransactionEntity) {
        navigator.pushTransactionDetailsView(transactionEntity: transactionEntity)
    }

    private func filterItems(byCategory categoryFilter: Int?) {
        guard let transactionsEntity else { return }

        let filteredTransactions = transactionsEntity.filter {
            categoryFilter == nil || $0.category == categoryFilter
        }

        prepareransactionList(filteredTransactions)

        let filteredTransactionSum = filteredTransactions.map(\.transactionDetail.value.amount).reduce(0) { $0 + $1 }
        header.transactionsSum = "\(filteredTransactionSum)"
    }
}

// -----------------------------------------------------------------------------
// MARK: - Prepare Model
// -----------------------------------------------------------------------------

extension TransactionListViewModel {
    private func loadModel() {
        modelBag = .init()
        toastController.state = .loading

        serviceProvider
            .transactionService()
            .getTransactionList()
            .map(\.items)
            .sink(receiveCompletion: { [weak self] in
                switch $0 {
                case let .failure(error):
                    self?.handleError(error: error)
                case .finished:
                    return
                }
            }, receiveValue: { [weak self] in
                self?.prepareModel($0)
            })
            .store(in: &modelBag)
    }

    private func handleError(error: Error) {
        toastController.state = .error(message: error.localizedDescription, dismissible: true) { [weak self] in
            self?.loadModel()
        }
    }

    private func prepareModel(_ transactions: [TransactionEntity]) {
        toastController.state = .hidden
        transactionsEntity = transactions

        prepareHeader(transactions)
        prepareransactionList(transactions)
    }

    private func prepareHeader(_ transactions: [TransactionEntity]) {
        var categories: [Int?] = Array(Set(transactions.map(\.category))).sorted()
        categories.insert(nil, at: 0)

        let transactionSum = transactions.map(\.transactionDetail.value.amount).reduce(0) { $0 + $1 }
        let header = TransactionListHeaderView.Model(
            transactionsSumTitle: Translations.localizedString("TransactionsValue"),
            transactionsSum: "\(transactionSum)",
            filterLabel: Translations.localizedString("Category"),
            allCategories: Translations.localizedString("All"),
            categories: categories
        )

        header.$category
            .sink { [weak self] in
                self?.filterItems(byCategory: $0)
            }
            .store(in: &actionBag)

        self.header = header
    }

    private func prepareransactionList(_ transactions: [TransactionEntity], categoryFilter: Int? = nil) {
        let sortedTransactions = transactions.sorted {
            $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
        }

        self.transactions = sortedTransactions.map(mapTransactionItem)
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
