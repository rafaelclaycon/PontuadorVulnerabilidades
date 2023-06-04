//
//  MainView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 27/05/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            CVEInfoView()
                .tabItem {
                    Text("Informações sobre a CVE")
                }
            
            CalculatorView()
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
