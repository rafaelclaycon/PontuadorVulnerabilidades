//
//  EnvironmentalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct EnvironmentalScoreView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Ambiental")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Text("")
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
            }
        }
    }
}

struct EnvironmentalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        EnvironmentalScoreView()
    }
}
