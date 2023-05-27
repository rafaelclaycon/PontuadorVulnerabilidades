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
    let cvss: Double
    let summary: String
}
