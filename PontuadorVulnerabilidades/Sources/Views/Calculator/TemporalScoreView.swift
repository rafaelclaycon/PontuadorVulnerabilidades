//
//  TemporalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct TemporalScoreView: View {
    
    @EnvironmentObject var calculatorViewModel: CalculatorViewModel
    
    @Binding var request: CVSSAPIRequest
    @Binding var overallScore: CVSSAPIResponse?
    
    @State private var temporalScore = TemporalScore()
    
    private var scoreNumber: String {
        guard let overallScore = overallScore else { return "" }
        guard request.exploitCodeMaturity != nil else { return "" }
        return "\(overallScore.temporalScore)"
    }
    
    private var baseScoreText: String {
        guard let overallScore = overallScore else { return "" }
        guard request.exploitCodeMaturity != nil else { return "" }
        return String.scoreText(overallScore.baseSeverity)
    }
    
    private var scoreColor: Color {
        guard let overallScore = overallScore else { return .yellow }
        guard request.exploitCodeMaturity != nil else { return .yellow }
        return String.scoreColor(overallScore.temporalScore)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Temporal")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text(scoreNumber)
                        .font(.title)
                        .bold()
                        .foregroundColor(scoreColor)
                    
                    Text(baseScoreText)
                        .bold()
                        .foregroundColor(scoreColor)
                }
            }
            
            VStack(spacing: 40) {
                ScorePickerView(selectedValue: $temporalScore.exploitCodeMaturity, pickerTitle: "Maturidade do Código Exploratório (E)")
                
                ScorePickerView(selectedValue: $temporalScore.remediationLevel, pickerTitle: "Nível de Remediação (RL)")
                
                ScorePickerView(selectedValue: $temporalScore.reportConfidence, pickerTitle: "Confiança do Relato (RC)")
            }
            
            Button("Calcular Pontuação Temporal") {
                Task {
                    request.exploitCodeMaturity = temporalScore.exploitCodeMaturity.value
                    request.remediationLevel = temporalScore.remediationLevel.value
                    request.reportConfidence = temporalScore.reportConfidence.value
                    calculatorViewModel.sendRequestToAPI()
                }
            }
        }
    }
}

struct TemporalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        TemporalScoreView(request: .constant(CVSSAPIRequest()), overallScore: .constant(nil))
    }
}
