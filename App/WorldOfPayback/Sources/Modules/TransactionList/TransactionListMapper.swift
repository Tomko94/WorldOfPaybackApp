//
//  TransactionListMapper.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

class TransactionListMapper {
    private var actionBag = Set<AnyCancellable>()
    
    func mapHeader(
        _ transactions: [TransactionEntity],
        initialCategory: Int? = nil,
        action: @escaping (Int?) -> Void
    ) -> TransactionListHeaderView.Model {
        var categories: [Int?] = Array(Set(transactions.map(\.category))).sorted()
        categories.insert(nil, at: 0)

        let transactionSum = transactionsSum(transactions, categoryFilter: initialCategory)

        let header = TransactionListHeaderView.Model(
            transactionsSumTitle: Translations.localizedString("TransactionsValue"),
            transactionsSum: "\(transactionSum)",
            filterLabel: Translations.localizedString("Category"),
            allCategories: Translations.localizedString("All"),
            categories: categories,
            selectedCategory: initialCategory
        )

        header.$selectedCategory
            .dropFirst()
            .sink { action($0) }
            .store(in: &actionBag)

        return header
    }

    func mapTransactionItem(
        _ transaction: TransactionEntity,
        action: @escaping (TransactionEntity) -> Void
    ) -> TransactionListItemView.Model {
        let item = TransactionListItemView.Model(transaction)

        item.action
            .sink { action(transaction) }
            .store(in: &actionBag)

        return item
    }

    func mapTransactions(
        _ transactions: [TransactionEntity],
        categoryFilter: Int? = nil,
        action: @escaping (TransactionEntity) -> Void
    ) -> [TransactionListItemView.Model] {
        let filteredTransactions = filterTransactions(transactions, categoryFilter: categoryFilter)

        let sortedTransactions = sortTransactions(filteredTransactions)

        return sortedTransactions.map { mapTransactionItem($0, action: action) }
    }

    func filterTransactions(_ transactions: [TransactionEntity], categoryFilter: Int?) -> [TransactionEntity] {
        transactions.filter {
            categoryFilter == nil || $0.category == categoryFilter
        }
    }

    func sortTransactions(_ transactions: [TransactionEntity]) -> [TransactionEntity] {
        transactions.sorted {
            $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate
        }
    }

    func transactionsSum(_ transactions: [TransactionEntity], categoryFilter: Int?) -> Decimal {
        let filteredTransactions = filterTransactions(transactions, categoryFilter: categoryFilter)

        return filteredTransactions.map(\.transactionDetail.value.amount).reduce(0) { $0 + $1 }
    }
}
