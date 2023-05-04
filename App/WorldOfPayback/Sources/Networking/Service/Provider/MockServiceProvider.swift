//
//  MockServiceProvider.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

class MockServiceProvider: ServiceProviderType {
    // MARK: - Private Properties

    private let mockDelay: Bool
    private let mockFailure: Bool

    // MARK: - Initialization

    init(mockDelay: Bool = true, mockFailure: Bool = true) {
        self.mockDelay = mockDelay
        self.mockFailure = mockFailure
    }

    // MARK: - ServiceProviderType

    func transactionService() -> TransactionServiceType {
        TransactionService(engine: MockEngine(mockDelay: mockDelay, mockFailure: mockFailure))
    }
}
