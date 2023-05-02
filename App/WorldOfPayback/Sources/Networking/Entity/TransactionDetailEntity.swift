//
//  TransactionDetailEntity.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

struct TransactionDetailEntity: Codable {
    let description: String?
    let bookingDate: Date
    let value: ValueEntity
}
