//
//  MockServiceProvider.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

class MockServiceProvider {
    func transactionService() -> TransactionServiceType {
        TransactionService(engine: MockEngine())
    }
}
