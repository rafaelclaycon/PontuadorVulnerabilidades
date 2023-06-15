//
//  KeychainHelper.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 14/06/23.
//

import Foundation

class KeychainHelper {
    
    static func read(for key: String, in account: String) throws -> String {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: kCFBooleanTrue,
            kSecReturnData as String: kCFBooleanTrue
        ]
        
        // Tenta obter um item existente da Keychain que atende aos requisitos da query.
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        // Verifica o status retornado e joga um erro se apropriado.
        guard status != errSecItemNotFound else { throw KeychainHelperError.itemNotFound }
        guard status == noErr else { throw KeychainHelperError.genericError(status.description) }
        
        // Faz o parse da String com a senha a partir do resultado retornado pela query.
        guard let existingItem = queryResult as? [String: AnyObject],
            let passwordData = existingItem[kSecValueData as String] as? Data,
            let password = String(data: passwordData, encoding: String.Encoding.utf8)
        else {
            throw KeychainHelperError.genericError(status.description)
        }
        
        return password
    }
    
    static func save(password: String, for key: String, in account: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password.data(using: .utf8)! as AnyObject,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly // Esse acesso mais restrito é recomendado por desenvolvedores experientes. Nesse caso, a Keychain só retornará o valor de fato se o aparelho estiver desbloqueado. Essa configuração também diz para a Keychain salvar a chave apenas nesse dispostivo.
        ]
        
        // Adiciona um novo item à Keychain.
        let status = SecItemAdd(query as CFDictionary, nil)
        
        // Joga um erro se o status de salvamento retornado não é o esperado
        guard status == noErr else { throw KeychainHelperError.genericError(status.description) }
    }
    
    static func updatePassword(password: String, for key: String, in account: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key as AnyObject,
            kSecAttrAccount as String: account as AnyObject
        ]

        let attributes: [String: AnyObject] = [
            kSecValueData as String: password.data(using: .utf8)! as AnyObject
        ]

        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        
        // Joga um erro se o status retornado é diferente do esperado.
        guard status == errSecSuccess else { throw KeychainHelperError.genericError(status.description) }
    }
}

enum KeychainHelperError: Error {
    
    case itemNotFound, genericError(String)
}

extension KeychainHelperError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .itemNotFound:
            return NSLocalizedString("Item não encontrado na Keychain.", comment: "")
        case .genericError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}
