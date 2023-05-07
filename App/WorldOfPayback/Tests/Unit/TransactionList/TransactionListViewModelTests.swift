//
//  TransactionListViewModelTests.swift
//  WorldOfPaybackTests
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import XCTest
@testable import WorldOfPayback

final class TransactionListViewModelTests: XCTestCase {
    private var bag: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        bag = .init()
    }

    func testFiltering() {
        let viewModel = TransactionListViewModel(
            navigator: TransactionListNavigator(rootNavigator: nil),
            serviceProvider: MockServiceProvider(mockDelay: false, mockFailure: false)
        )
        let loadedExpectation = self.expectation(description: "ViewModel Loaded")
        
        viewModel.onAppear()
        viewModel
            .$transactions
            .dropFirst()
            .sink { transactions in
                loadedExpectation.fulfill()
            }
            .store(in: &bag)
        
        XCTWaiter().wait(for: [loadedExpectation], timeout: 2)
        bag = .init()
        
        viewModel.header.selectedCategory = 3
        
        let filteredExpectation = self.expectation(description: "Transactions Filtered")
        var filteredTransactions: [TransactionListItemView.Model] = []
        
        viewModel
            .$transactions
            .sink { transactions in
                filteredTransactions = transactions
                filteredExpectation.fulfill()
            }
            .store(in: &bag)
        
        XCTWaiter().wait(for: [filteredExpectation], timeout: 2)
        bag = .init()
        
        XCTAssertEqual(filteredTransactions.count, 1, "Transactions are filtered")
    }
}
