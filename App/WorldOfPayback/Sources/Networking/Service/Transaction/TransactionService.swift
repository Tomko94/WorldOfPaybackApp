//
//  TransactionService.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

class TransactionService: TransactionServiceType {
    func getTransactionList() -> AnyPublisher<TransactionListEntity, Error> {
        fatalError("Not implemented")
    }
}
