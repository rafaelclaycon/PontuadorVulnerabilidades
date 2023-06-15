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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .low:
            return "L"
        case .medium:
            return "M"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .low:
            return "L"
        case .medium:
            return "M"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .low:
            return "L"
        case .medium:
            return "M"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .network:
            return "N"
        case .adjacentNetwork:
            return "A"
        case .local:
            return "L"
        case .physical:
            return "P"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .low:
            return "L"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .none:
            return "N"
        case .required:
            return "L"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .unchanged:
            return "U"
        case .changed:
            return "C"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
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
    
    var value: String {
        switch self {
        case .notDefined:
            return "X"
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
}

struct EnvironmentalScore {
    
    var confidentialityRequirement: ConfidentialityRequirement
    var integrityRequirement: IntegrityRequirement
    var availabilityRequirement: AvailabilityRequirement
    
    var modifiedAttackVector: ModifiedAttackVector
    var modifiedAttackComplexity: ModifiedAttackComplexity
    var modifiedPrivilegesRequired: ModifiedPrivilegesRequired
    var modifiedUserInteraction: ModifiedUserInteraction
    var modifiedScope: ModifiedScope
    var modifiedConfidentiality: ModifiedConfidentiality
    var modifiedIntegrity: ModifiedIntegrity
    var modifiedAvailability: ModifiedAvailability
    
    init(
        confidentialityRequirement: ConfidentialityRequirement = .notDefined,
        integrityRequirement: IntegrityRequirement = .notDefined,
        availabilityRequirement: AvailabilityRequirement = .notDefined,
        modifiedAttackVector: ModifiedAttackVector = .notDefined,
        modifiedAttackComplexity: ModifiedAttackComplexity = .notDefined,
        modifiedPrivilegesRequired: ModifiedPrivilegesRequired = .notDefined,
        modifiedUserInteraction: ModifiedUserInteraction = .notDefined,
        modifiedScope: ModifiedScope = .notDefined,
        modifiedConfidentiality: ModifiedConfidentiality = .notDefined,
        modifiedIntegrity: ModifiedIntegrity = .notDefined,
        modifiedAvailability: ModifiedAvailability = .notDefined
    ) {
        self.confidentialityRequirement = confidentialityRequirement
        self.integrityRequirement = integrityRequirement
        self.availabilityRequirement = availabilityRequirement
        self.modifiedAttackVector = modifiedAttackVector
        self.modifiedAttackComplexity = modifiedAttackComplexity
        self.modifiedPrivilegesRequired = modifiedPrivilegesRequired
        self.modifiedUserInteraction = modifiedUserInteraction
        self.modifiedScope = modifiedScope
        self.modifiedConfidentiality = modifiedConfidentiality
        self.modifiedIntegrity = modifiedIntegrity
        self.modifiedAvailability = modifiedAvailability
    }
}
