//
//  MockTransactionService.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

class MockTransactionService: TransactionServiceType {
    func getTransactionList() -> AnyPublisher<TransactionListEntity, Error> {
        MockEngine()
            .getEntity(forName: "PBTransactions")
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
