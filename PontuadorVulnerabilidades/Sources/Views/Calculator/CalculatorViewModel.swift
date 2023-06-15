//
//  CalculatorViewModel.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 13/06/23.
//

import Combine
import Foundation

func objectToJSON<T: Codable>(object: T) -> String? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        let jsonData = try encoder.encode(object)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        }
    } catch {
        print("Failed to encode object to JSON: \(error)")
    }
    
    return nil
}

class CalculatorViewModel: ObservableObject {
    
    @Published var request = CVSSAPIRequest()
    @Published var result: CVSSAPIResponse? = nil
    
    func sendRequestToAPI() {
        Task {
            let url = URL(string: "https://127.0.0.1:5000/calculate-cvss")!
            
            do {
                print(request)
                
                if let jsonString = objectToJSON(object: request) {
                    print(jsonString)
                }
                
                let response: CVSSAPIResponse = try await Networking.post(to: url, body: request)
                print(response)
                DispatchQueue.main.async {
                    self.result = response
                }
            } catch {
                print(error)
            }
        }
    }
}
