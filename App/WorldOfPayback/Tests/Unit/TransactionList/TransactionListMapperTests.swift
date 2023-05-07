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
    func testMapTransactionsFiltering() {
        let mapper = TransactionListMapper()

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

        let transactionsModel = mapper.mapTransactions(transactionEntityList) { _ in }

        XCTAssertEqual(transactionsModel.count, 3, "All transactions should be mapped")
        XCTAssertEqual(transactionsModel.map(\.partnerNameText), ["A", "B", "C"], "Transactions should be sorted by date, newest to oldest")
    }

    func testMapTransactionItem() {
        let mapper = TransactionListMapper()

        let transactionEntity = TransactionEntity(
            partnerDisplayName: "partnerName",
            alias: AliasEntity(reference: ""),
            category: 1,
            transactionDetail: TransactionDetailEntity(
                description: "description",
                bookingDate: Calendar.current.date(from: DateComponents(year: 2012, month: 3, day: 23, hour: 15, minute: 37))!,
                value: ValueEntity(amount: 1, currency: "USD")
            )
        )

        let transactionItem = mapper.mapTransactionItem(transactionEntity) { _ in }

        XCTAssertEqual(transactionItem.partnerNameText, "partnerName")
        XCTAssertEqual(transactionItem.amountText, "1 USD")
        XCTAssertEqual(transactionItem.dateText, "23.03.2012 15:37", "Date should be formatted correctly")
    }

    func testMapHeader() {
        let mapper = TransactionListMapper()

        let transactionEntityList = [
            TransactionEntity(
                partnerDisplayName: "",
                alias: AliasEntity(reference: ""),
                category: 2,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                    value: ValueEntity(amount: 10, currency: "USD")
                )
            ),
            TransactionEntity(
                partnerDisplayName: "",
                alias: AliasEntity(reference: ""),
                category: 1,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                    value: ValueEntity(amount: 20, currency: "USD")
                )
            ),
            TransactionEntity(
                partnerDisplayName: "",
                alias: AliasEntity(reference: ""),
                category: 2,
                transactionDetail: TransactionDetailEntity(
                    description: nil,
                    bookingDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
                    value: ValueEntity(amount: 5, currency: "USD")
                )
            )
        ]

        let header = mapper.mapHeader(transactionEntityList) { _ in }

        XCTAssertEqual(header.transactionsSumText, "35", "Transactions values should be summed correctly")
        XCTAssertEqual(header.categories, [nil, 1, 2], "Options should be unique and contain default")
    }
}
