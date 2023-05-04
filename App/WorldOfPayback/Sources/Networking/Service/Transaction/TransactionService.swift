//
//  TransactionService.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

protocol TransactionServiceType {
    func getTransactionList() -> AnyPublisher<TransactionListEntity, Error>
}

class TransactionService: BaseService, TransactionServiceType {
    func getTransactionList() -> AnyPublisher<TransactionListEntity, Error> {
        Future { promise in
            Task {
                do {
                    let result = try await self.engine.sendRequest(endpoint: TransactionEndpoint.transactions, responseModel: TransactionListEntity.self)
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
