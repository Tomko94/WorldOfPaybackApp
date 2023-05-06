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

    @ObservedObject internal var viewModel: ViewModel

    // MARK: - Body Definition

    internal var body: some View {
        VStack(spacing: Layout.Spacing.medium) {
            TransactionListHeaderView(viewModel.header)
                .padding(.horizontal, Layout.Spacing.medium)

            List {
                ForEach(viewModel.transactions) {
                    TransactionListItemView($0)
                }
            }
            .animation(.default, value: viewModel.transactions)
        }
        .padding(.vertical, Layout.Spacing.medium)
        .toastController(with: viewModel.toastController)
        .navigationBar(with: viewModel.title)
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
