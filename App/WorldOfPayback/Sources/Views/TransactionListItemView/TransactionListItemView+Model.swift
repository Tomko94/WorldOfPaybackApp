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
        public let partnerNameText: String
        public let trensactionDescriptionText: String?
        public let dateText: String
        public let amountText: String

        public var action = PassthroughSubject<Void, Never>()

        // MARK: - Initialization

        public init(partnerNameText: String, trensactionDescriptionText: String?, dateText: String, amountText: String) {
            self.partnerNameText = partnerNameText
            self.trensactionDescriptionText = trensactionDescriptionText
            self.dateText = dateText
            self.amountText = amountText
        }

        convenience init(_ entity: TransactionEntity) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Translations.localizedString("DateAndTimeFormat")
            self.init(
                partnerNameText: entity.partnerDisplayName,
                trensactionDescriptionText: entity.transactionDetail.description,
                dateText: dateFormatter.string(from: entity.transactionDetail.bookingDate),
                amountText: entity.transactionDetail.value.displayString
            )
        }

        // MARK: - Equatable

        public static func == (lhs: TransactionListItemView.Model, rhs: TransactionListItemView.Model) -> Bool {
            lhs.amountText == rhs.amountText &&
                lhs.partnerNameText == rhs.partnerNameText &&
                lhs.trensactionDescriptionText == rhs.trensactionDescriptionText &&
                lhs.dateText == rhs.dateText &&
                lhs.amountText == rhs.amountText
        }
    }
}
