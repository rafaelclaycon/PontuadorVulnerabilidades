//
//  CVEResponseCIRCL.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import Foundation

struct CVEResponseCIRCL: Codable {
    
    let id: String
    let cwe: String
    let cvss: Double?
    let summary: String
    let capec: [CAPEC]
    let cvssVector: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case cwe
        case cvss
        case summary
        case capec
        case cvssVector = "cvss-vector"
    }
}

struct CAPEC: Codable, Identifiable {
    
    let id: String
    let name: String
    let prerequisites: String
    let related_weakness: [String]?
    let solutions: String
    let summary: String
}
