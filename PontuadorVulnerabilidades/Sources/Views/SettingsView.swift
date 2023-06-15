//
//  SettingsView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 14/06/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isBeingShown: Bool
    
    @State private var nvdAPIKey: String = ""
    
    // Alert
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Configurações")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            
            Text("Esse programa usa a API da National Vulnerability Database (NVD) para obter os dados das CVEs. Para que ele funcione, é necessário que você solicite e receba uma chave única da API usando o seu e-mail.")
            
            Text("[Solicite uma chave aqui.](https://nvd.nist.gov/developers/request-an-api-key)")
            
            HStack(spacing: 15) {
                Spacer()
                
                Text("Sua chave da API da NVD:")
                
                TextField("", text: $nvdAPIKey)
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 15) {
                Spacer()
                
                Button {
                    if !nvdAPIKey.isEmpty {
                        if isValidInput() {
                            Task {
                                do {
                                    // Primeiro fazemos uma leitura porque se a chave já existir na Keychain, devemos atualizá-la ao invés de só salvarmos.
                                    if try KeychainHelper.read(for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId) != "" {
                                        try KeychainHelper.updatePassword(password: nvdAPIKey, for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId)
                                    }
                                } catch KeychainHelperError.itemNotFound {
                                    do {
                                        // ESSE É O JEITO CERTO DE SE SALVAR DADOS SENSÍVEIS DO USUÁRIO.
                                        try KeychainHelper.save(password: nvdAPIKey, for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId)
                                    } catch {
                                        print(error)
                                        showAlert(title: "Erro ao Tentar Salvar a Chave da API", message: error.localizedDescription)
                                        return
                                    }
                                } catch {
                                    print(error)
                                    showAlert(title: "Erro ao Tentar Salvar a Chave da API", message: error.localizedDescription)
                                    return
                                }
                            }
                        } else {
                            showAlert(title: "Entrada Inválida", message: "Por favor, informe uma chave válida.")
                            return
                        }
                    }
                    
                    isBeingShown = false
                } label: {
                    Text("Salvar")
                        .padding(.horizontal)
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding(.all, 26)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            Task {
                do {
                    nvdAPIKey = try KeychainHelper.read(for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    private func isValidInput() -> Bool {
        guard !nvdAPIKey.isEmpty else { return false }
        guard nvdAPIKey.contains("-") else { return false }
        let range = NSRange(location: 0, length: nvdAPIKey.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")
        return regex.firstMatch(in: nvdAPIKey, options: [], range: range) != nil
    }
    
    private func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(isBeingShown: .constant(true))
    }
}
