//
//  CVSSAPIRequest.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 06/06/23.
//

import Foundation

struct CVSSAPIRequest: Codable {
    
    var attackVector: String  = "N"
    var attackComplexity: String = "L"
    var privilegesRequired: String = "N"
    var userInteraction: String = "N"
    var scope: String = "U"
    var confidentiality: String = "N"
    var integrity: String = "N"
    var availability: String = "N"
    
    var exploitCodeMaturity: String? = nil
    var remediationLevel: String? = nil
    var reportConfidence: String? = nil
    
    var confidentialityRequirement: String? = nil
    var integrityRequirement: String? = nil
    var availabilityRequirement: String? = nil
    var modifiedAttackVector: String? = nil
    var modifiedAttackComplexity: String? = nil
    var modifiedPrivilegesRequired: String? = nil
    var modifiedUserInteraction: String? = nil
    var modifiedScope: String? = nil
    var modifiedConfidentiality: String? = nil
    var modifiedIntegrity: String? = nil
    var modifiedAvailability: String? = nil
}
