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
    // Define TransactionListViewModelType here.
}

internal final class TransactionListViewModel: ViewModelLayer<TransactionListNavigator>, TransactionListViewModelType {
    private let serviceProvider: ServiceProviderType
    private var bag = Set<AnyCancellable>()

    init(navigator: TransactionListNavigator, _ serviceProvider: ServiceProviderType = ServiceProvider()) {
        self.serviceProvider = serviceProvider
        super.init(navigator: navigator)

        prepareModel()
    }
}

extension TransactionListViewModel {
    private func prepareModel() {
        serviceProvider
            .transactionService()
            .getTransactionList()
            .print()
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

    private func prepareModel(_ transactions: [TransactionEntity]) {}
}
