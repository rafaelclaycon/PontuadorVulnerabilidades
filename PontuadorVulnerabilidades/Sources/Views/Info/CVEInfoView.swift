//
//  CVEInfoView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CVEInfoView: View {
    
    @Binding var baseScore: BaseScore?
    @Binding var hasSetAPIKey: Bool
    
    @State private var cveCode: String = ""
    @State private var cveReponse: CVEResponseNVD? = nil
    @State private var showLoader: Bool = false
    
    // Alert
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 25) {
                    HStack(spacing: 15) {
                        Spacer()
                        
                        Text("Informe o código da CVE:")
                        
                        TextField("CVE-YYYY-XXXXX", text: $cveCode)
                            .textFieldStyle(.roundedBorder)
                        
                        Button("Procurar") {
                            if isValidInput() {
                                lookUp(cve: cveCode)
                            } else {
                                alertTitle = "Entrada Inválida"
                                alertMessage = "Por favor, informe um códige de CVE no formato CVE-YYYY-XXXXX."
                                showAlert = true
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: 500)
                    .disabled(!hasSetAPIKey)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        if cveReponse != nil {
                            HStack {
                                Text(cveReponse?.vulnerabilities.first?.cve.id ?? "")
                                    .font(.largeTitle)
                                    .bold()
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("DESCRIÇÃO")
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                            
                            Text(cveReponse?.vulnerabilities.first?.cve.englishDescription() ?? "")
                            
                            if cveReponse?.cvssVectorString() == nil {
                                Text("Não há informações suficientes para calcular a pontuação CVSS dessa vulnerabilidade automaticamente. Você ainda pode calculá-la manualmente na aba Calculadora.")
                                    .foregroundColor(.orange)
                                    .padding(.top)
                            } else {
                                HStack(spacing: 15) {
                                    Image(systemName: "checkmark.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 15)
                                        .foregroundColor(.green)
                                    
                                    Text("Pontuação básica CVSS disponível na aba Calculadora.")
                                        .foregroundColor(.green)
                                }
                                .padding(.top)
                            }
                            
                            HStack(spacing: 30) {
                                StackedDataView(title: "PUBLICADA EM", value: cveReponse?.vulnerabilities.first?.cve.published.toScreenString() ?? "")
                                
                                Divider()
                                
                                StackedDataView(title: "MODIFICADA POR ÚLTIMO EM", value: cveReponse?.vulnerabilities.first?.cve.lastModified.toScreenString() ?? "")
                                
                                Divider()
                                
                                StackedDataView(title: "STATUS", value: cveReponse?.vulnerabilities.first?.cve.vulnStatus ?? "")
                                
                                Divider()
                                
                                StackedDataView(title: "IDENTIFICADOR DA FONTE", value: cveReponse?.vulnerabilities.first?.cve.sourceIdentifier ?? "")
                                
                                Spacer()
                            }
                            .padding(.vertical)
                            
                            HStack {
                                Text("CPEs:")
                                    .font(.title2)
                                  //  .foregroundColor(.gray)
                                
                                Spacer()
                            }
                            
                            let getCPE =  cveReponse?.vulnerabilities.first?.cve.configurations.first?.nodes?.first?.cpeMatch
                            CPEView(cve: getCPE)
                        }
                        else {
                            if !hasSetAPIKey {
                                Text("Você precisar informar a chave da API da NVD em Configurações antes de poder usar a consulta de CVEs.")
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding(.all, 26)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            if showLoader {
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                    
                    ProcessingView(message: "Consultando dados...")
                    
                    Spacer()
                }
            }
        }
    }
    
    private func isValidInput() -> Bool {
        guard !cveCode.isEmpty else { return false }
        guard cveCode.contains("-") else { return false }
        let range = NSRange(location: 0, length: cveCode.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^CVE-\\d{4}-\\d{4,7}$")
        return regex.firstMatch(in: cveCode, options: [], range: range) != nil
    }
    
    private func lookUp(cve: String) {
        Task {
            let url = URL(string: "https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=\(cve)")!
            showLoader = true
            do {
                let apiKey = try KeychainHelper.read(for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId)
                
                let response: CVEResponseNVD = try await Networking.get(from: url, apiKey: apiKey)
                
                guard response.totalResults > 0 else {
                    cveReponse = nil
                    showLoader = false
                    showAlert(title: "Nenhum Resultado Encontrado", message: "Por favor, informe um código CVE diferente.")
                    return
                }
                
                cveReponse = response
                
                guard let cvssVector = cveReponse?.cvssVectorString() else { return showLoader = false }
                print(cvssVector)
                baseScore = try BaseScore(vector: cvssVector)
                print(baseScore as Any)
                showLoader = false
            } catch {
                showLoader = false
                print(error)
                showAlert(title: "Ocorreu um Erro ao Tentar Obter os Dados da CVE", message: error.localizedDescription)
                showAlert = true
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
}

struct CVEInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        CVEInfoView(baseScore: .constant(nil), hasSetAPIKey: .constant(true))
    }
}
