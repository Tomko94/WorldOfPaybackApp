//
//  TransactionListItemView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

public struct TransactionListItemView: View {
    // MARK: - private Properties

    private let model: Model

    // MARK: - Initialization

    internal init(_ model: Model) {
        self.model = model
    }

    // MARK: - Body Definition

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Layout.Spacing.none) {
                Text(model.partnerNameText)
                    .font(.headline)

                model.trensactionDescriptionText.map {
                    Text($0)
                        .font(.caption)
                }

                Text(model.dateText)
                    .font(.caption2)
                    .padding(.top, Layout.Spacing.tiny)
            }

            Spacer()

            VStack(alignment: .leading, spacing: Layout.Spacing.none) {
                Text(model.amountText)
                    .font(.headline)
                    .padding(.bottom, Layout.Spacing.tiny)
            }
        }
        .padding(.horizontal, Layout.Spacing.small)
        .padding(.vertical, Layout.Spacing.tiny)
        .contentShape(Rectangle())
        .onTapGesture {
            model.action.send()
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

struct TransactionListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListItemView(.init(
            partnerNameText: "partnerName",
            trensactionDescriptionText: nil,
            dateText: "12.12.2004 12:45",
            amountText: "123 PBP"
        ))
    }
}
