//
//  CVEInfoView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CVEInfoView: View {
    
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
                print(response)
                cveReponse = response
            } catch {
                print(error)
            }
        }
    }
}

struct CVEInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        CVEInfoView()
    }
}
