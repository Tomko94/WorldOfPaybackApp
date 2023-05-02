//
//  TransactionEntity.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

struct TransactionEntity: Codable {
    let partnerDisplayName: String
    let alias: AliasEntity
    let category: Int
    let transactionDetail: TransactionDetailEntity
}
