//
//  TemporalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct TemporalScoreView: View {
    
    @State private var exploitCodeMaturity: ExploitCodeMaturity = .notDefined
    @State private var remediationLevel: RemediationLevel = .notDefined
    @State private var reportConfidence: ReportConfidence = .notDefined
    
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
            
            VStack(spacing: 40) {
                ScorePickerView(selectedValue: $exploitCodeMaturity, pickerTitle: "Maturidade do Código Exploratório (E)")
                
                ScorePickerView(selectedValue: $remediationLevel, pickerTitle: "Nível de Remediação (RL)")
                
                ScorePickerView(selectedValue: $reportConfidence, pickerTitle: "Confiança do Relato (RC)")
            }
            
            Button("Calcular Pontuação Temporal") {
                //sendRequestToAPI()
            }
        }
    }
}

struct TemporalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        TemporalScoreView()
    }
}
