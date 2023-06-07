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
    
    static func `get`<T: Codable, B: Encodable>(from url: URL, body: B? = nil) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let requestBody = body {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(requestBody)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
}
