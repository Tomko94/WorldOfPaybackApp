//  
//  TransactionDetailsView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 03/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI
import SwiftUIArch

internal struct TransactionDetailsView<ViewModel: TransactionDetailsViewModelType>: View, ViewLayerType {
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

internal struct TransactionDetailsView_Previews: PreviewProvider {
    internal static var previews: some View {
        TransactionDetailsView(viewModel: TransactionDetailsViewModel(navigator: TransactionDetailsNavigator(rootNavigator: nil)))
    }
}
