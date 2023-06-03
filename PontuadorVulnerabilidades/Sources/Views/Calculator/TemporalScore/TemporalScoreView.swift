//
//  TemporalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct TemporalScoreView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Temporal")
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

struct TemporalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        TemporalScoreView()
    }
}
