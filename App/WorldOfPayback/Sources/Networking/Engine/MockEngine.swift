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
    // MARK: - Private Properties

    private let mockDelay: Bool
    private let mockFailure: Bool

    // MARK: - Initialization

    init(mockDelay: Bool = true, mockFailure: Bool = true) {
        self.mockDelay = mockDelay
        self.mockFailure = mockFailure
    }

    // MARK: - EngineType

    func sendRequest<T>(endpoint: Endpoint, responseModel: T.Type) async throws -> T where T: Decodable {
        guard let path = endpoint.mockFilePath else {
            throw NetworkError.invalidURL
        }

        guard let json = Bundle.main.url(forResource: path, withExtension: ".json") else {
            throw NetworkError.invalidURL
        }

        if mockDelay {
            try await Task.sleep(for: .seconds(Double.random(in: 1 ..< 2)))
        }

        if mockFailure, Int.random(in: 0 ..< 100) <= 40 {
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
