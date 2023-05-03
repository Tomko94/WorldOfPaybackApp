//
//  TransactionListHeaderView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct TransactionListHeaderView: View {
    @ObservedObject private var model: Model

    internal init(_ model: Model) {
        self.model = model
    }

    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 5) {
                Text(model.transactionsSumTitle)
                    .font(.caption)
                Text(model.transactionsSum)
                    .font(.caption)
            }

            Spacer()

            Picker(model.filterLabel, selection: $model.category) {
                ForEach(model.categories, id: \.self) { category in
                    if let category {
                        Text(String(category))
                    } else {
                        Text("All")
                    }
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct TransactionListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListHeaderView(
            TransactionListHeaderView.Model(
                transactionsSumTitle: "Transactions value",
                transactionsSum: "234 PBP",
                filterLabel: "Category",
                categories: [nil, 1, 2, 3]
            )
        )
    }
}
