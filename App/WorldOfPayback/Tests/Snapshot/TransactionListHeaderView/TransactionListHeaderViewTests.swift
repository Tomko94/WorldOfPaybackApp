//
//  TransactionListHeaderViewTests.swift
//  WorldOfPaybackTests
//
//  Created by Tomasz Węsierski on 08/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SnapshotTesting
import SwiftUI
import XCTest
@testable import WorldOfPayback

final class TransactionListHeaderViewTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }

    func testTransactionListHeaderView() throws {
        let headerModel = TransactionListHeaderView.Model(
            transactionsSumTitleText: "Sum title",
            transactionsSumText: "123 USD",
            filterLabelText: "Filter label",
            allCategoriesText: "All",
            categories: [nil, 1, 2],
            selectedCategory: nil
        )
        let headerView = TransactionListHeaderView(headerModel)
        let view: UIView = UIHostingController(rootView: headerView).view

        isRecording = false
        assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize))
    }
}
