//
//  TransactionListMapperTests.swift
//  WorldOfPaybackTests
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import XCTest
@testable import WorldOfPayback

final class TransactionListMapperTests: XCTestCase {
    func testMapTransactions() {
        let transactionEntityList = [
            TransactionEntity(
                partnerDisplayName: "A",
                alias: AliasEntity(reference: ""),
                category: 1,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                    value: ValueEntity(amount: 1, currency: "USD")
                )
            ),
            TransactionEntity(
                partnerDisplayName: "B",
                alias: AliasEntity(reference: ""),
                category: 1,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                    value: ValueEntity(amount: 1, currency: "USD")
                )
            ),
            TransactionEntity(
                partnerDisplayName: "C",
                alias: AliasEntity(reference: ""),
                category: 1,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
                    value: ValueEntity(amount: 1, currency: "USD")
                )
            )
        ]

        let mapper = TransactionListMapper()

        let transactionsModel = mapper.mapTransactions(transactionEntityList) { _ in }

        XCTAssertEqual(transactionsModel.count, 3, "All transactions should be mapped")
        XCTAssertEqual(transactionsModel.map(\.partnerName), ["A", "B", "C"], "Transactions should be sorted by date, newest to oldest")
    }
}
