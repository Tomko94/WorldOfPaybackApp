//
//  MockEngine.swift
//  WorldOfPayback
//
//  Created by Tomasz Węsierski on 02/05/2023.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import Combine
import Foundation

class MockEngine {
    func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }

    func getMockData(forName name: String) -> AnyPublisher<Data, Error> {
        Bundle.main.url(forResource: name, withExtension: ".json")
            .publisher
            .tryMap { string in
                guard let data = try? Data(contentsOf: string) else {
                    fatalError("Failed to load \(name) from bundle.")
                }
                return data
            }
            .eraseToAnyPublisher()
    }

    func getEntity<T: Decodable>(forName name: String) -> AnyPublisher<T, Error> {
        getMockData(forName: name)
            .decode(type: T.self, decoder: jsonDecoder())
            .delay(for: .seconds(Double.random(in: 1 ..< 2)), scheduler: RunLoop.current)
            .eraseToAnyPublisher()
    }
}
