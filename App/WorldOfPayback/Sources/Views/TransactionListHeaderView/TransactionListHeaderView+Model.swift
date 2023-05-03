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
        
        @Published public var transactionsSumTitle: String
        @Published public var transactionsSum: String
        
        @Published public var filterLabel: String
        @Published public var categories: [Int?]
        
        @Published public var category: Int? = nil
        
        init(transactionsSumTitle: String = "", transactionsSum: String = "", filterLabel: String = "", categories: [Int?] = []) {
            self.transactionsSumTitle = transactionsSumTitle
            self.transactionsSum = transactionsSum
            self.filterLabel = filterLabel
            self.categories = categories
        }
    }
}
