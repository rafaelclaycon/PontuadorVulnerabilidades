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
