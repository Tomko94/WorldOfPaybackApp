//
//  TransactionListItemViewTests.swift
//  WorldOfPaybackTests
//
//  Created by Tomasz Węsierski on 07/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import WorldOfPayback

final class TransactionListItemViewTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }

    func testTransactionListItemView() throws {
        let listItemModel = TransactionListItemView.Model(
            partnerName: "partnerName",
            trensactionDescription: "transactionDescription",
            date: "12.12.1234 12:12",
            amount: "123 USD"
        )
        let listItemView = TransactionListItemView(listItemModel)
        let view: UIView = UIHostingController(rootView: listItemView).view

        isRecording = false
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
}
