//
//  Endpoint.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 04/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var mockFilePath: String? { get }
}

extension Endpoint {
    var scheme: String {
        "https"
    }

    var host: String {
        "api-test.payback.com/transactions" // TODO: host config
    }

    var mockFilePath: String? {
        nil
    }
}
