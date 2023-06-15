//
//  EnvironmentalScore.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Claycon Schmitt on 08/06/23.
//

import Foundation

enum ConfidentialityRequirement: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, low, medium, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .low:
            return "Baixo (L)"
        case .medium:
            return "Médio (M)"
        case .high:
            return "Alto (H)"
        }
    }
}

enum IntegrityRequirement: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, low, medium, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .low:
            return "Baixo (L)"
        case .medium:
            return "Médio (M)"
        case .high:
            return "Alto (H)"
        }
    }
}

enum AvailabilityRequirement: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, low, medium, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .low:
            return "Baixo (L)"
        case .medium:
            return "Médio (M)"
        case .high:
            return "Alto (H)"
        }
    }
}

enum ModifiedAttackVector: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, network, adjacentNetwork, local, physical
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .network:
            return "Rede (N)"
        case .adjacentNetwork:
            return "Rede Adjacente (A)"
        case .local:
            return "Local (L)"
        case .physical:
            return "Físico (P)"
        }
    }
}

enum ModifiedAttackComplexity: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinida (X)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

// MARK: - MPR
enum ModifiedPrivilegesRequired: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .none:
            return "Nenhum (N)"
        case .low:
            return "Baixo (L)"
        case .high:
            return "Alto (H)"
        }
    }
}

// MARK: - MUI
enum ModifiedUserInteraction: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, none, required
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .none:
            return "Nenhuma (N)"
        case .required:
            return "Necessária (L)"
        }
    }
}

// MARK: - MS
enum ModifiedScope: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, unchanged, changed
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .unchanged:
            return "Não Modificado (U)"
        case .changed:
            return "Modificado (C)"
        }
    }
}

// MARK: - MC
enum ModifiedConfidentiality: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

// MARK: - MI
enum ModifiedIntegrity: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}

// MARK: - MA
enum ModifiedAvailability: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
    case notDefined, none, low, high
    var id: Self { self }
    
    var description: String {
        switch self {
        case .notDefined:
            return "Indefinido (X)"
        case .none:
            return "Nenhuma (N)"
        case .low:
            return "Baixa (L)"
        case .high:
            return "Alta (H)"
        }
    }
}
