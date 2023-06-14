//
//  MainView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var baseScore: BaseScore? = nil
    @State private var showSettings: Bool = false
    @State private var hasSetAPIKey: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            TabView {
                CVEInfoView(baseScore: $baseScore, hasSetAPIKey: $hasSetAPIKey)
                    .tabItem {
                        Text("Informações sobre a CVE")
                    }
                
                CalculatorView(baseScore: $baseScore)
                    .tabItem {
                        Text("Calculadora de Pontuação CVSS")
                    }
            }
            
            ZStack {
                Text("This product uses the NVD API but is not endorsed or certified by the NVD.")
                    .foregroundColor(.gray)
                
                HStack {
                    Button {
                        showSettings = true
                    } label: {
                        Label("Configurações", systemImage: "gearshape")
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(isBeingShown: $showSettings)
                            .frame(width: 600, height: 300)
                    }
                    
                    Spacer()
                }
            }
            .padding(.top)
        }
        .padding(.all, 26)
        .onAppear {
            checkIfAPIKeyIsSet()
        }
        .onChange(of: showSettings) { showSettings in
            if !showSettings {
                checkIfAPIKeyIsSet()
            }
        }
    }
    
    private func checkIfAPIKeyIsSet() {
        Task {
            do {
                hasSetAPIKey = try KeychainHelper.read(for: Strings.Keychain.apiKeyKey, in: Strings.Keychain.bundleId) != ""
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
