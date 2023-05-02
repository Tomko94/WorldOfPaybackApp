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
        Text("Hello, world!")
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
