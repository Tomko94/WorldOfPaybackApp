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
        VStack(spacing: 15) {
            Text(viewModel.partnerName)
                .font(.title)

            viewModel.description.map {
                Text($0)
            }
        }
        .padding(.vertical, 15)
        .navigationTitle("Transaction Details")
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

internal struct TransactionDetailsView_Previews: PreviewProvider {
    internal static var previews: some View {
        TransactionDetailsView(
            viewModel: TransactionDetailsViewModel(
                navigator: TransactionDetailsNavigator(rootNavigator: nil),
                transactionEntity: TransactionEntity(
                    partnerDisplayName: "partnerDisplayName",
                    alias: AliasEntity(reference: ""),
                    category: 0,
                    transactionDetail: TransactionDetailEntity(
                        description: "description",
                        bookingDate: Date(),
                        value: ValueEntity(amount: 23, currency: "USD")
                    )
                )
            )
        )
    }
}
