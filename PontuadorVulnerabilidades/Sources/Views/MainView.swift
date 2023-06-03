//
//  MainView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = 0
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
                
                Picker("", selection: $selectedTab) {
                    Text("Informações").tag(0)
                    Text("Calculadora").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 500)
                .padding(.vertical)
                
                if selectedTab == 0 {
                    CVEInfoView(cveReponse: $cveReponse)
                } else {
                    CalculatorView()
                }
            }
            .padding(.all, 26)
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

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
