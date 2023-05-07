//
//  TransactionDetailsMapperTest.swift
//  WorldOfPaybackTests
//
//  Created by Tomasz Węsierski on 08/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import XCTest
@testable import WorldOfPayback

final class TransactionDetailsMapperTest: XCTestCase {
    func testMapPartnerName() {
        let mapper = TransactionDetailsMapper()

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

        let partnerName = mapper.mapPartnerName(transactionEntity)

        XCTAssertEqual(partnerName, "partnerName")
    }

    func testMapDescription() {
        let mapper = TransactionDetailsMapper()

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

        let description = mapper.mapDescription(transactionEntity)

        XCTAssertEqual(description, "description")
    }
}
