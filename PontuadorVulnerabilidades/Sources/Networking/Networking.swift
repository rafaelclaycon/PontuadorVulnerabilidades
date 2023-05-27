//
//  Networking.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import Foundation

class Networking {
    
    static func `get`<T: Codable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
}
