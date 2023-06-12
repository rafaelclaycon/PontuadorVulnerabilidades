//
//  Networking.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import Foundation

class SelfSignedCertificateDelegate: NSObject, URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                let serverTrust = challenge.protectionSpace.serverTrust
                completionHandler(.useCredential, URLCredential(trust: serverTrust!))
            } else {
                completionHandler(.performDefaultHandling, nil)
            }
        }
}

class Networking {
    
    static func `get`<T: Codable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
    
    static func post<T: Codable, B: Encodable>(to url: URL, body: B? = nil) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        if let requestBody = body {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(requestBody)
            print(request.httpBody?.description as Any)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // Create a custom URLSession configuration
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForResource = 30
        
        let session = URLSession(configuration: sessionConfig, delegate: SelfSignedCertificateDelegate(), delegateQueue: nil)
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse
        }
        
        let statusCode = httpResponse.statusCode
        print(statusCode)
        if statusCode < 200 || statusCode >= 300 {
            throw NetworkingError.httpError(statusCode: statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
}

enum NetworkingError: Error {
    
    case invalidResponse, httpError(statusCode: Int)
}

extension NetworkingError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return NSLocalizedString("400 Bad Request", comment: "")
        case .httpError(statusCode: let statusCode):
            return NSLocalizedString("\(statusCode)", comment: "")
        }
    }
}
