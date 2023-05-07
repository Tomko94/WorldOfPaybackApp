//
//  TransactionListHeaderView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct TransactionListHeaderView: View {
    // MARK: - private Properties

    @ObservedObject private var model: Model
    
    // MARK: - Initialization
    
    internal init(_ model: Model) {
        self.model = model
    }

    // MARK: - Body Definition
    
    var body: some View {
        HStack(spacing: Layout.Spacing.small) {
            VStack(spacing: Layout.Spacing.tiny) {
                Text(model.transactionsSumTitleText)
                    .font(.caption)
                Text(model.transactionsSumText)
                    .font(.caption)
            }

            Spacer()

            Picker(model.filterLabelText, selection: $model.selectedCategory) {
                ForEach(model.categories, id: \.self) { category in
                    if let category {
                        Text(String(category))
                    } else {
                        Text(model.allCategoriesText)
                    }
                }
            }
        }
        .padding(.horizontal, Layout.Spacing.medium)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

struct TransactionListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListHeaderView(
            TransactionListHeaderView.Model(
                transactionsSumTitleText: "Transactions value",
                transactionsSumText: "234 PBP",
                filterLabelText: "Category",
                categories: [nil, 1, 2, 3]
            )
        )
    }
}
