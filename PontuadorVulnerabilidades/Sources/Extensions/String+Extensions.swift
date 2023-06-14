//
//  String+Extensions.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 13/06/23.
//

import Foundation
import SwiftUI

// MARK: - Format ISO 8601 date string
extension String {
    
    func toScreenString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let date = dateFormatter.date(from: self)

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd/MM/yyyy" // HH:mm
        return outputDateFormatter.string(from: date!)
    }
}

// MARK: - CVSS Score Helpers
extension String {
    
    static func scoreText(_ severity: String) -> String {
        switch severity.uppercased() {
        case "NONE":
            return "NENHUMA"
        case "LOW":
            return "BAIXA"
        case "MEDIUM":
            return "MÉDIA"
        case "HIGH":
            return "ALTA"
        case "CRITICAL":
            return "CRÍTICA"
        default:
            return severity.uppercased()
        }
    }
    
    static func scoreColor(_ score: Double) -> Color {
        switch score {
        case 0..<4:
            return .green
        case 4..<7:
            return .yellow
        case 7..<9:
            return .orange
        default:
            return .red
        }
    }
}
