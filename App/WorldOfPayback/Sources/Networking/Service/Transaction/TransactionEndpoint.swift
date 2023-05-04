//
//  TransactionEndpoint.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

enum TransactionEndpoint {
    case transactions
}

extension TransactionEndpoint: Endpoint {
    var path: String {
        switch self {
        case .transactions:
            return "/transactions"
        }
    }

    var method: RequestMethod {
        switch self {
        case .transactions:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .transactions:
            return [:]
        }
    }

    var body: [String: String]? {
        switch self {
        case .transactions:
            return nil
        }
    }

    var mockFilePath: String? {
        switch self {
        case .transactions:
            return "PBTransactions"
        }
    }
}
