//
//  TransactionListItemView.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

public struct TransactionListItemView: View {
    private let model: Model

    internal init(_ model: Model) {
        self.model = model
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(model.partnerName)
                    .font(.headline)

                model.trensactionDescription.map {
                    Text($0)
                        .font(.caption)
                }

                Text(model.date)
                    .font(.caption2)
                    .padding(.top, 5)
            }

            Spacer()

            VStack(alignment: .leading, spacing: 0) {
                Text(model.amount)
                    .font(.headline)
                    .padding(.bottom, 5)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .contentShape(Rectangle())
        .onTapGesture {
            model.action.send()
        }
    }
}

struct TransactionListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListItemView(.init(partnerName: "partnerName", trensactionDescription: nil, date: "12.12.2004 12:45", amount: "123 PBP"))
    }
}
