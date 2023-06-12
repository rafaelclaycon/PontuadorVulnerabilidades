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
    
    static func from(value: String) -> AttackVector? {
        switch value {
        case "N":
            return .network
        case "A":
            return .adjacent
        case "L":
            return .local
        case "P":
            return .physical
        default:
            return nil
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
    
    static func from(value: String) -> AttackComplexity? {
        switch value {
        case "L":
            return .low
        case "H":
            return .high
        default:
            return nil
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
    
    static func from(value: String) -> PrivilegesRequired? {
        switch value {
        case "N":
            return PrivilegesRequired.none
        case "L":
            return .low
        case "H":
            return .high
        default:
            return nil
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
    
    static func from(value: String) -> UserInteraction? {
        switch value {
        case "N":
            return UserInteraction.none
        case "R":
            return .required
        default:
            return nil
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
    
    static func from(value: String) -> Scope? {
        switch value {
        case "U":
            return .unchanged
        case "C":
            return .changed
        default:
            return nil
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
    
    static func from(value: String) -> Confidentiality? {
        switch value {
        case "N":
            return Confidentiality.none
        case "L":
            return .low
        case "H":
            return .high
        default:
            return nil
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
    
    static func from(value: String) -> Integrity? {
        switch value {
        case "N":
            return Integrity.none
        case "L":
            return .low
        case "H":
            return .high
        default:
            return nil
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
    
    static func from(value: String) -> Availability? {
        switch value {
        case "N":
            return Availability.none
        case "L":
            return .low
        case "H":
            return .high
        default:
            return nil
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
            guard let attackVector = AttackVector.from(value: String(components[0])) else { throw CVSSConversionError.invalidMetric("Vetor de Ataque veio \"\(String(components[0]))\"") }
            self.attackVector = attackVector
            
            guard let attackComplexity = AttackComplexity.from(value: String(components[1])) else { throw CVSSConversionError.invalidMetric("Complexidade do Ataque veio \"\(String(components[1]))\"") }
            self.attackComplexity = attackComplexity
            
            guard let privilegesRequired = PrivilegesRequired.from(value: String(components[2])) else { throw CVSSConversionError.invalidMetric("Privilégios Necessários veio \"\(components[2])\"") }
            self.privilegesRequired = privilegesRequired
            
            self.userInteraction = .required
            self.scope = .unchanged
            
            guard let confidentiality = Confidentiality.from(value: String(components[3])) else { throw CVSSConversionError.invalidMetric("Confidencialidade veio \"\(components[3])\"") }
            self.confidentiality = confidentiality
            
            guard let integrity = Integrity.from(value: String(components[4])) else { throw CVSSConversionError.invalidMetric("Integridade veio \"\(components[4])\"") }
            self.integrity = integrity
            
            guard let availability = Availability.from(value: String(components[5])) else { throw CVSSConversionError.invalidMetric("Disponibilidade veio \"\(components[5])\"") }
            self.availability = availability
        } else if components.count == 8 {
            guard let attackVector = AttackVector.from(value: String(components[0])) else { throw CVSSConversionError.invalidMetric("Vetor de Ataque veio \"\(String(components[0]))\"") }
            self.attackVector = attackVector
            
            guard let attackComplexity = AttackComplexity.from(value: String(components[1])) else { throw CVSSConversionError.invalidMetric("Complexidade do Ataque veio \"\(String(components[1]))\"") }
            self.attackComplexity = attackComplexity
            
            guard let privilegesRequired = PrivilegesRequired.from(value: String(components[2])) else { throw CVSSConversionError.invalidMetric("Privilégios Necessários veio \"\(components[2])\"") }
            self.privilegesRequired = privilegesRequired
            
            guard let userInteraction = UserInteraction.from(value: String(components[3])) else { throw CVSSConversionError.invalidMetric("Interação do Usuário veio \"\(components[3])\"") }
            self.userInteraction = userInteraction
            
            guard let scope = Scope.from(value: String(components[4])) else { throw CVSSConversionError.invalidMetric("Escopo veio \"\(components[4])\"") }
            self.scope = scope
            
            guard let confidentiality = Confidentiality.from(value: String(components[5])) else { throw CVSSConversionError.invalidMetric("Confidencialidade veio \"\(components[5])\"") }
            self.confidentiality = confidentiality
            
            guard let integrity = Integrity.from(value: String(components[6])) else { throw CVSSConversionError.invalidMetric("Integridade veio \"\(components[6])\"") }
            self.integrity = integrity
            
            guard let availability = Availability.from(value: String(components[7])) else { throw CVSSConversionError.invalidMetric("Disponibilidade veio \"\(components[7])\"") }
            self.availability = availability
        } else {
            throw CVSSConversionError.invalidVectorFormat
        }
    }
}

enum CVSSConversionError: Error {
    
    case invalidVectorFormat, invalidMetric(String)
}

extension CVSSConversionError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidVectorFormat:
            return NSLocalizedString("Formato de vetor inválido.", comment: "")
        case .invalidMetric(let message):
            return NSLocalizedString("Métrica inválida: \(message)", comment: "")
        }
    }
}
