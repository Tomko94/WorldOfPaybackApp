//
//  BaseService.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

class BaseService {
    let engine: EngineType
    
    init(engine: EngineType) {
        self.engine = engine
    }
}
