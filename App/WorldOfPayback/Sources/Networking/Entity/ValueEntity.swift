//
//  ValueEntity.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 01/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

public struct ValueEntity: Codable, Hashable {
    let amount: Decimal
    let currency: String
}
