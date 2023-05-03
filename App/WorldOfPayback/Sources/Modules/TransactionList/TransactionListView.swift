//
//  TransactionListView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

internal struct TransactionListView<ViewModel: TransactionListViewModelType>: View, ViewLayerType {
    // MARK: - Internal Properties

    @StateObject internal var viewModel: ViewModel

    // MARK: - Body Definition

    internal var body: some View {
        VStack(spacing: 15) {
            TransactionListHeaderView(viewModel.header)
                .padding(.horizontal, 15)

            List {
                ForEach(viewModel.transactions) {
                    TransactionListItemView($0)
                }
            }
            .animation(.default, value: viewModel.transactions)
        }
        .padding(.vertical, 15)
        .navigationTitle("Transactions")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(
            Color.gray,
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

internal struct TransactionListView_Previews: PreviewProvider {
    internal static var previews: some View {
        TransactionListView(viewModel: TransactionListViewModel(navigator: TransactionListNavigator(rootNavigator: nil)))
    }
}
