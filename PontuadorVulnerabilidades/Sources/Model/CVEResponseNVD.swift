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
    
    func cvssVectorString() -> String? {
        if let cvssVectorV31 = self.vulnerabilities.first?.cve.metrics.cvssMetricV31?.first?.cvssData.vectorString {
            return cvssVectorV31
        } else if let cvssVectorV30 = self.vulnerabilities.first?.cve.metrics.cvssMetricV30?.first?.cvssData.vectorString {
            return cvssVectorV30
        } else {
            return nil
        }
    }
    
    func cpes() -> [CVEcpeMatch] {
        guard let cve = self.vulnerabilities.first?.cve else { return [] }
        guard let matches = cve.cveCPEMatches() else { return [] }
        return matches
    }
}

struct NVDVulnerability: Codable {
    
    let cve: NVDCVE
}

struct NVDCVE: Codable {
    
    let id: String
    let descriptions: [CVEDescription]
    let published: String
    let lastModified: String
    let vulnStatus: String
    let sourceIdentifier: String
    let metrics: CVEMetrics
    
    let configurations: [CVEConfiguration]
    
    func englishDescription() -> String? {
        guard let enDescription = descriptions.first(where: { $0.lang == "en" }) else {
            return nil
        }
        return enDescription.value
    }
    
    func cveCPEMatches() -> [CVEcpeMatch]? {
        guard let CVEcpeMatch = configurations.first?.nodes?.first?.cpeMatch else {
            return nil
        }
        return CVEcpeMatch
    }
}

struct CVEDescription: Codable {
    
    let lang: String
    let value: String
}

struct CVEMetrics: Codable {
    
    let cvssMetricV30: [CVSSMetric]?
    let cvssMetricV31: [CVSSMetric]?
}

struct CVSSMetric: Codable {
    
    let cvssData: CVSSData
}

struct CVSSData: Codable {
    
    let vectorString: String
}

struct CVEConfiguration: Codable {
    
    let nodes: [CVENodes]?
    
}
struct CVENodes: Codable {

    let cpeMatch: [CVEcpeMatch]?
    
}

struct CVEcpeMatch: Codable, Identifiable {
    
    let vulnerable: Bool
    let criteria: String
    let versionEndExcluding: String
    let matchCriteriaId: String
    
    var id: String { return criteria }
}
