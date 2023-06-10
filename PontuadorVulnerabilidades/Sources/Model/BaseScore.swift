//
//  BaseScore.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import Foundation

enum AttackVector: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .network:
            return "N"
        case .adjacent:
            return "A"
        case .local:
            return "L"
        case .physical:
            return "P"
        }
    }
    
    static func from(value: String) -> AttackVector {
        switch value {
        case "A":
            return .adjacent
        case "L":
            return .local
        case "P":
            return .physical
        default:
            return .network
        }
    }
}

enum AttackComplexity: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
    
    static func from(value: String) -> AttackComplexity {
        switch value {
        case "H":
            return .high
        default:
            return .low
        }
    }
}

enum PrivilegesRequired: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
    
    static func from(value: String) -> PrivilegesRequired {
        switch value {
        case "L":
            return .low
        case "H":
            return .high
        default:
            return .none
        }
    }
}

enum UserInteraction: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .none:
            return "N"
        case .required:
            return "R"
        }
    }
    
    static func from(value: String) -> UserInteraction {
        switch value {
        case "R":
            return .required
        default:
            return .none
        }
    }
}

enum Scope: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .unchanged:
            return "U"
        case .changed:
            return "C"
        }
    }
    
    static func from(value: String) -> Scope {
        switch value {
        case "C":
            return .changed
        default:
            return .unchanged
        }
    }
}

enum Confidentiality: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
    
    static func from(value: String) -> Confidentiality {
        switch value {
        case "L":
            return .low
        case "H":
            return .high
        default:
            return .none
        }
    }
}

enum Integrity: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
    
    static func from(value: String) -> Integrity {
        switch value {
        case "L":
            return .low
        case "H":
            return .high
        default:
            return .none
        }
    }
}

enum Availability: String, CaseIterable, Identifiable, Hashable, CustomStringConvertible {
    
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
    
    var value: String {
        switch self {
        case .none:
            return "N"
        case .low:
            return "L"
        case .high:
            return "H"
        }
    }
    
    static func from(value: String) -> Availability {
        switch value {
        case "L":
            return .low
        case "H":
            return .high
        default:
            return .none
        }
    }
}

struct BaseScore {
    
    var attackVector: AttackVector
    var attackComplexity: AttackComplexity
    var privilegesRequired: PrivilegesRequired
    var userInteraction: UserInteraction
    var scope: Scope
    var confidentiality: Confidentiality
    var integrity: Integrity
    var availability: Availability
    
    init(
        attackVector: AttackVector = .network,
        attackComplexity: AttackComplexity = .low,
        privilegesRequired: PrivilegesRequired = .none,
        userInteraction: UserInteraction = .none,
        scope: Scope = .unchanged,
        confidentiality: Confidentiality = .none,
        integrity: Integrity = .none,
        availability: Availability = .none
    ) {
        self.attackVector = attackVector
        self.attackComplexity = attackComplexity
        self.privilegesRequired = privilegesRequired
        self.userInteraction = userInteraction
        self.scope = scope
        self.confidentiality = confidentiality
        self.integrity = integrity
        self.availability = availability
    }
    
    init(vector: String) throws {
        let components = vector.split(separator: "/")
        
        if components.count == 6 {
            attackVector = AttackVector.from(value: String(components[0]))
            attackComplexity = AttackComplexity.from(value: String(components[1]))
            privilegesRequired = PrivilegesRequired.from(value: String(components[2]))
            userInteraction = .required
            scope = .unchanged
            confidentiality = Confidentiality.from(value: String(components[3]))
            integrity = Integrity.from(value: String(components[4]))
            availability = Availability.from(value: String(components[5]))
        } else if components.count == 8 {
            attackVector = AttackVector.from(value: String(components[0]))
            attackComplexity = AttackComplexity.from(value: String(components[1]))
            privilegesRequired = PrivilegesRequired.from(value: String(components[2]))
            userInteraction = UserInteraction.from(value: String(components[3]))
            scope = Scope.from(value: String(components[4]))
            confidentiality = Confidentiality.from(value: String(components[5]))
            integrity = Integrity.from(value: String(components[6]))
            availability = Availability.from(value: String(components[7]))
        } else {
            throw BaseScoreError.invalidVectorFormat
        }
    }
}

enum BaseScoreError: Error {
    
    case invalidVectorFormat
}

extension BaseScoreError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidVectorFormat:
            return NSLocalizedString("Formato de vetor inválido.", comment: "")
        }
    }
}
