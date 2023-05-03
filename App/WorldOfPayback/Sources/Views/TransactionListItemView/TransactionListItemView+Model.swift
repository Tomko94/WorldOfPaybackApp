//
//  TransactionListItemView+Model.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import SwiftUI

extension TransactionListItemView {
    public final class Model: ObservableObject, Identifiable, Equatable {
        // MARK: - Public Properties

        public let id = UUID()
        public let partnerName: String
        public let trensactionDescription: String?
        public let date: String
        public let amount: String

        public var action = PassthroughSubject<Void, Never>()

        // MARK: - Initialization

        public init(partnerName: String, trensactionDescription: String?, date: String, amount: String) {
            self.partnerName = partnerName
            self.trensactionDescription = trensactionDescription
            self.date = date
            self.amount = amount
        }

        convenience init(_ entity: TransactionEntity) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Translations.localizedString("DateAndTimeFormat")
            self.init(
                partnerName: entity.partnerDisplayName,
                trensactionDescription: entity.transactionDetail.description,
                date: dateFormatter.string(from: entity.transactionDetail.bookingDate),
                amount: entity.transactionDetail.value.displayString
            )
        }

        // MARK: - Equatable

        public static func == (lhs: TransactionListItemView.Model, rhs: TransactionListItemView.Model) -> Bool {
            lhs.amount == rhs.amount &&
                lhs.partnerName == rhs.partnerName &&
                lhs.trensactionDescription == rhs.trensactionDescription &&
                lhs.date == rhs.date &&
                lhs.amount == rhs.amount
        }
    }
}
