//
//  CalculatorView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CalculatorView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            BaseScoreView()
            
            TemporalScoreView()
            
            EnvironmentalScoreView()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalculatorView()
    }
}
