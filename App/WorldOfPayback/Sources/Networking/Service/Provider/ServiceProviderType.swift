//
//  ServiceProviderType.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

protocol ServiceProviderType {
    func transactionService() -> TransactionServiceType
}
