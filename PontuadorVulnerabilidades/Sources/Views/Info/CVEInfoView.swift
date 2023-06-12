//
//  CVEInfoView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CVEInfoView: View {
    
    @Binding var baseScore: BaseScore?
    
    @State private var cveCode: String = ""
    @State private var cveReponse: CVEResponse? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Spacer()
                    
                    Text("Informe o código da CVE:")
                    
                    TextField("CVE-YYYY-XXXXX", text: $cveCode)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Procurar") {
                        if isValidInput() {
                            lookUp(cve: cveCode)
                        } else {
                            print("Invalid input")
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: 500)
                
                VStack(alignment: .leading, spacing: 15) {
                    if cveReponse != nil {
                        
                        if cveReponse?.cvssVector == nil {
                            Text("Não há informações suficientes para calcular a pontuação CVSS dessa vulnerabilidade automaticamente. Você ainda pode calculá-la manualmente na aba Calculadora.")
                                .foregroundColor(.orange)
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
                        }
                        
                        HStack {
                            Text(cveReponse?.id ?? "")
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
                        
                        Text(cveReponse?.summary ?? "")
                        
                        HStack {
                            Text("CAPECs")
                                .font(.callout)
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        ForEach(cveReponse!.capec) { capec in
                            CAPECView(capec: capec)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(.all, 26)
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
            let url = URL(string: "https://cve.circl.lu/api/cve/\(cve)")!
            do {
                let response: CVEResponse = try await Networking.get(from: url)
                //print(response)
                cveReponse = response
                
                guard let cvssVector = cveReponse?.cvssVector else { return }
                baseScore = try BaseScore(vector: cvssVector)
                print(baseScore as Any)
            } catch {
                print(error)
            }
        }
    }
}

struct CVEInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        CVEInfoView(baseScore: .constant(nil))
    }
}
