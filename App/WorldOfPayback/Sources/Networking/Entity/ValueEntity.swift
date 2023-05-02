//
//  ValueEntity.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

struct ValueEntity: Codable {
    let amount: Decimal
    let currency: String
}
