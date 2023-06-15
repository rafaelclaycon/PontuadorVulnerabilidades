//
//  BaseScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct BaseScoreView: View {
    
    @EnvironmentObject var calculatorViewModel: CalculatorViewModel
    
    @Binding var baseScore: BaseScore?
    @Binding var request: CVSSAPIRequest
    @Binding var overallScore: CVSSAPIResponse?
    
    @State private var unwrappedBaseScore = BaseScore()
    
    private var baseScoreNumber: String {
        guard let overallScore = overallScore else { return "" }
        return "\(overallScore.baseScore)"
    }
    
    private var baseScoreText: String {
        guard let overallScore = overallScore else { return "" }
        return String.scoreText(overallScore.baseSeverity)
    }
    
    private var scoreColor: Color {
        guard let overallScore = overallScore else { return .yellow }
        return String.scoreColor(overallScore.temporalScore)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Básica")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text(baseScoreNumber)
                        .font(.title)
                        .bold()
                        .foregroundColor(scoreColor)
                    
                    Text(baseScoreText)
                        .bold()
                        .foregroundColor(scoreColor)
                }
            }
            
            HStack(spacing: 30) {
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $unwrappedBaseScore.attackVector, pickerTitle: "Vetor de Ataque (AV)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.attackComplexity, pickerTitle: "Complexidade do Ataque (AC)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.privilegesRequired, pickerTitle: "Privilégios Necessários (PR)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.userInteraction, pickerTitle: "Interação do Usuário (UI)")
                }
                
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $unwrappedBaseScore.scope, pickerTitle: "Escopo (S)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.confidentiality, pickerTitle: "Confidencialidade (C)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.integrity, pickerTitle: "Integridade (I)")
                    
                    ScorePickerView(selectedValue: $unwrappedBaseScore.availability, pickerTitle: "Disponibilidade (A)")
                }
            }
            
            Button("Calcular Pontuação Básica") {
                calculateScore()
            }
        }
        .onAppear {
            Task {
                guard let baseScore = baseScore else { return }
                unwrappedBaseScore = baseScore
                calculateScore()
            }
        }
    }
    
    private func calculateScore() {
        request.attackVector = unwrappedBaseScore.attackVector.value
        request.attackComplexity = unwrappedBaseScore.attackComplexity.value
        request.privilegesRequired = unwrappedBaseScore.privilegesRequired.value
        request.userInteraction = unwrappedBaseScore.userInteraction.value
        request.scope = unwrappedBaseScore.scope.value
        request.confidentiality = unwrappedBaseScore.confidentiality.value
        request.integrity = unwrappedBaseScore.integrity.value
        request.availability = unwrappedBaseScore.availability.value
        calculatorViewModel.sendRequestToAPI()
    }
}

struct BaseScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        BaseScoreView(baseScore: .constant(nil), request: .constant(CVSSAPIRequest()), overallScore: .constant(nil))
    }
}
