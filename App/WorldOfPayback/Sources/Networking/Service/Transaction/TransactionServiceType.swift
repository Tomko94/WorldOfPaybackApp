//
//  TransactionServiceType.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation
import Combine

protocol TransactionServiceType {
    func getTransactionList() -> AnyPublisher<TransactionListEntity ,Error>
}
