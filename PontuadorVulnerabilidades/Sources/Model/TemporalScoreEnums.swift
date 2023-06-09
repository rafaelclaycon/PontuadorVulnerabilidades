//
//  TemporalScoreEnums.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Claycon Schmitt on 08/06/23.
//

import Foundation

enum ExploitCodeMaturity: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, unproven, proofOfConcept, functional, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinida (X)"
        case .unproven:
            return "Não Provada (U)"
        case .proofOfConcept:
            return "Prova de Conceito (P)"
        case .functional:
            return "Funcional (F)"
        case .high:
            return "Alta (H)"
        }
    }
}

enum RemediationLevel: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, officialFix, temporaryFix, workaround, unavailable
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .officialFix:
            return "Correção Oficial (O)"
        case .temporaryFix:
            return "Correção Temporária (T)"
        case .workaround:
            return "Workaround (W)"
        case .unavailable:
            return "Indisponível (U)"
        }
    }
}

enum ReportConfidence: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, unknown, reasonable, confirmed
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinida (X)"
        case .unknown:
            return "Desconhecida (U)"
        case .reasonable:
            return "Razoável (R)"
        case .confirmed:
            return "Confirmada (C)"
        }
    }
}
