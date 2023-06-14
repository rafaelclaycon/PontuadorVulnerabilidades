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
        VStack(spacing: 10) {
//            HStack {
//                Button {
//                    print("Settings")
//                } label: {
//                    Image(systemName: "gearshape")
//                }
//                
//                Spacer()
//            }
            
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
            
            Text("This product uses the NVD API but is not endorsed or certified by the NVD.")
                .foregroundColor(.gray)
                .padding(.top)
        }
        .padding(.all, 26)
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
