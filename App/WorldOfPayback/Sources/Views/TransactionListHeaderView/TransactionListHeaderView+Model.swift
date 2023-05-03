//
//  TransactionListHeaderView+Model.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

extension TransactionListHeaderView {
    public final class Model: ObservableObject {
        // MARK: - Published Properties

        @Published public var transactionsSumTitle: String
        @Published public var transactionsSum: String
        @Published public var filterLabel: String
        @Published public var allCategories: String
        @Published public var categories: [Int?]
        @Published public var category: Int? = nil

        // MARK: - Initialization

        init(transactionsSumTitle: String = "", transactionsSum: String = "", filterLabel: String = "", allCategories: String = "", categories: [Int?] = []) {
            self.transactionsSumTitle = transactionsSumTitle
            self.transactionsSum = transactionsSum
            self.filterLabel = filterLabel
            self.allCategories = allCategories
            self.categories = categories
        }
    }
}
