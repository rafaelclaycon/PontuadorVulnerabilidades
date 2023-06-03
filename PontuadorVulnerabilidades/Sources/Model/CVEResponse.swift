//
//  CVEResponse.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import Foundation

struct CVEResponse: Codable {
    
    let id: String
    let cwe: String
    let cvss: Double?
    let summary: String
    let capec: [CAPEC]
}

struct CAPEC: Codable, Identifiable {
    
    let id: String
    let name: String
    let prerequisites: String
    let related_weakness: [String]?
    let solutions: String
    let summary: String
}
