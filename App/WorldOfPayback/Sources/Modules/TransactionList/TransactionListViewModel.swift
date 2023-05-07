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
    private var transactionEntityList: [TransactionEntity]?
    private var modelBag = Set<AnyCancellable>()
    private var mapper = TransactionListMapper()

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

    private func filterChanged(byCategory categoryFilter: Int?) {
        guard let transactionEntityList else { return }

        let sum = mapper.transactionsSum(transactionEntityList, categoryFilter: categoryFilter)
        header.transactionsSumText = "\(sum)"

        transactions = mapTransactions(transactionEntityList, categoryFilter: categoryFilter)
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

    private func prepareModel(_ transactionsEntity: [TransactionEntity]) {
        toastController.state = .hidden
        transactionEntityList = transactionsEntity

        header = mapHeader(transactionsEntity)
        transactions = mapTransactions(transactionsEntity)
    }

    private func mapHeader(_ transactions: [TransactionEntity], initialCategory: Int? = nil) -> TransactionListHeaderView.Model {
        mapper.mapHeader(transactions, initialCategory: initialCategory) { [weak self] categoryFilter in
            self?.filterChanged(byCategory: categoryFilter)
        }
    }

    private func mapTransactions(
        _ transactionsEntity: [TransactionEntity],
        categoryFilter: Int? = nil
    ) -> [TransactionListItemView.Model] {
        mapper.mapTransactions(transactionsEntity, categoryFilter: categoryFilter) { [weak self] transactionEntity in
            self?.transactionSelected(transactionEntity: transactionEntity)
        }
    }
}
