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

        @Published public var transactionsSumTitleText: String
        @Published public var transactionsSumText: String
        @Published public var filterLabelText: String
        @Published public var allCategoriesText: String
        @Published public var categories: [Int?]
        @Published public var selectedCategory: Int?

        // MARK: - Initialization

        init(
            transactionsSumTitleText: String = "",
            transactionsSumText: String = "",
            filterLabelText: String = "",
            allCategoriesText: String = "",
            categories: [Int?] = [],
            selectedCategory: Int? = nil
        ) {
            self.transactionsSumTitleText = transactionsSumTitleText
            self.transactionsSumText = transactionsSumText
            self.filterLabelText = filterLabelText
            self.allCategoriesText = allCategoriesText
            self.categories = categories
            self.selectedCategory = selectedCategory
        }
    }
}
