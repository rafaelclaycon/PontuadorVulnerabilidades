//
//  MainView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var baseScore: BaseScore? = nil
    
    var body: some View {
        TabView {
            CVEInfoView(baseScore: $baseScore)
                .tabItem {
                    Text("Informações sobre a CVE")
                }
            
            CalculatorView(baseScore: $baseScore)
                .tabItem {
                    Text("Calculadora de Pontuação CVSS")
                }
        }
        .padding(.all, 26)
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
