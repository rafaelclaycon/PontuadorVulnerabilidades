//
//  CVEResponseNVD.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 12/06/23.
//

import Foundation

struct CVEResponseNVD: Codable {
    
    let totalResults: Int
    let vulnerabilities: [NVDVulnerability]
}

struct NVDVulnerability: Codable {
    
    let cve: NVDCVE
}

struct NVDCVE: Codable {
    
    let id: String
    let descriptions: [CVEDescription]
    
    func englishDescription() -> String? {
        guard let enDescription = descriptions.first(where: { $0.lang == "en" }) else {
            return nil
        }
        return enDescription.value
    }
}

struct CVEDescription: Codable {
    
    let lang: String
    let value: String
}
