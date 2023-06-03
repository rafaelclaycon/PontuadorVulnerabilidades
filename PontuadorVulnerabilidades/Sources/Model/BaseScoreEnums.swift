//
//  BaseScoreEnums.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import Foundation

enum AttackVector: String, CaseIterable, Identifiable, Hashable {
    
    case network, adjacent, local, physical
    var id: Self { self }
    
    var description: String {
        switch self {
        case .network:
            return "Rede (N)"
        case .adjacent:
            return "Adjacente (A)"
        case .local:
            return "Local (L)"
        case .physical:
            return "Físico (P)"
        }
    }
}

enum AttackComplexity: String, CaseIterable, Identifiable, Hashable {
    
    case low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

enum PrivilegesRequired: String, CaseIterable, Identifiable, Hashable {
    
    case none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .none:
            return "Nenhum (N)"
        case .low:
            return "Baixos (L)"
        case .high:
            return "Altos (H)"
        }
    }
}

enum UserInteraction: String, CaseIterable, Identifiable, Hashable {
    
    case none, required
    var id: Self { self }
    
    var description: String {
        switch self {
        case .none:
            return "Nenhuma (N)"
        case .required:
            return "Necessária (R)"
        }
    }
}

enum Scope: String, CaseIterable, Identifiable, Hashable {
    
    case unchanged, changed
    var id: Self { self }
    
    var description: String {
        switch self {
        case .unchanged:
            return "Não Alterado (U)"
        case .changed:
            return "Alterado (C)"
        }
    }
}

enum Confidentiality: String, CaseIterable, Identifiable, Hashable {
    
    case none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

enum Integrity: String, CaseIterable, Identifiable, Hashable {
    
    case none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

enum Availability: String, CaseIterable, Identifiable, Hashable {
    
    case none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}
