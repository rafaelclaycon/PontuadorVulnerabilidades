//
//  CVSSAPIResponse.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 06/06/23.
//

import Foundation

struct CVSSAPIResponse: Codable {
    
    let baseScore: Double
    let baseSeverity: String
    let environmentalScore: Double
    let environmentalSeverity: String
    let temporalScore: Double
    let temporalSeverity: String
}
