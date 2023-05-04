//
//  MockEngine.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

class MockEngine: EngineType {
    func sendRequest<T>(endpoint: Endpoint, responseModel: T.Type) async throws -> T where T: Decodable {
        guard let path = endpoint.mockFilePath else {
            throw NetworkError.invalidURL
        }

        guard let json = Bundle.main.url(forResource: path, withExtension: ".json") else {
            throw NetworkError.invalidURL
        }

        try await Task.sleep(for: .seconds(Double.random(in: 1 ..< 2)))

        if Int.random(in: 0 ..< 100) <= 100 {
            throw NetworkError.unknown
        }

        guard let data = try? Data(contentsOf: json) else {
            throw NetworkError.decode
        }

        guard let entity = try? JSONDecoder.default.decode(T.self, from: data) else {
            throw NetworkError.decode
        }

        return entity
    }
}
