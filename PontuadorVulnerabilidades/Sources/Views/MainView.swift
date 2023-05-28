//
//  MainView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var cveCode: String = "CVE-2019-3568"
    @State private var cveReponse: CVEResponse? = nil
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                TextField("CVE", text: $cveCode)
                    .textFieldStyle(.roundedBorder)
                
                Button("Pesquisar") {
                    lookUp(cve: cveCode)
                }
            }
            .frame(width: 300)
            
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
            }
            
            Spacer()
        }
        .padding()
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
