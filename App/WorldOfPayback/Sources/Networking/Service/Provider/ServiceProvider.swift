//
//  ServiceProvider.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

class ServiceProvider: ServiceProviderType {
    func transactionService() -> TransactionServiceType {
        TransactionService(engine: MockEngine()) // TODO: replace with actual implementation, when backend ready
    }
}
