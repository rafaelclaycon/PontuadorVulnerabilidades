//
//  EnvironmentalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct EnvironmentalScoreView: View {
    
    @EnvironmentObject var calculatorViewModel: CalculatorViewModel
    
    @Binding var request: CVSSAPIRequest
    @Binding var overallScore: CVSSAPIResponse?
    
    @State private var environmentalScore = EnvironmentalScore()
    
    private var scoreNumber: String {
        guard let overallScore = overallScore else { return "" }
        guard request.confidentialityRequirement != nil else { return "" }
        return "\(overallScore.environmentalScore)"
    }
    
    private var scoreText: String {
        guard let overallScore = overallScore else { return "" }
        guard request.confidentialityRequirement != nil else { return "" }
        return String.scoreText(overallScore.environmentalSeverity)
    }
    
    private var scoreColor: Color {
        guard let overallScore = overallScore else { return .yellow }
        guard request.confidentialityRequirement != nil else { return .yellow }
        return String.scoreColor(overallScore.environmentalScore)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Ambiental")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text(scoreNumber)
                        .font(.title)
                        .bold()
                        .foregroundColor(scoreColor)
                    
                    Text(scoreText)
                        .bold()
                        .foregroundColor(scoreColor)
                }
            }
            
            HStack(spacing: 30) {
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $environmentalScore.confidentialityRequirement, pickerTitle: "Requisito de Confidencialidade (CR)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.integrityRequirement, pickerTitle: "Requisito de Integridade (IR)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.availabilityRequirement, pickerTitle: "Requisito de Disponibilidade (AR)")
                    
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $environmentalScore.modifiedAttackVector, pickerTitle: "Vetor de Ataque Modificado (MAV)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedAttackComplexity, pickerTitle: "Complexidade do Ataque Modificada (MAC)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedPrivilegesRequired, pickerTitle: "Privilégios Necessários Modificados (MPR)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedUserInteraction, pickerTitle: "Interação do Usuário Modificada (MUI)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedScope, pickerTitle: "Escopo Modificado (MS)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedConfidentiality, pickerTitle: "Confidencialidade Modificada (MC)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedIntegrity, pickerTitle: "Integridade Modificada (MI)")
                    
                    ScorePickerView(selectedValue: $environmentalScore.modifiedAvailability, pickerTitle: "Disponibilidade Modificada (MA)")
                }
            }
            
            Button("Calcular Pontuação Ambiental") {
                Task {
                    request.confidentialityRequirement = environmentalScore.confidentialityRequirement.value
                    request.integrityRequirement = environmentalScore.integrityRequirement.value
                    request.availabilityRequirement = environmentalScore.availabilityRequirement.value
                    request.modifiedAttackVector = environmentalScore.modifiedAttackVector.value
                    request.modifiedAttackComplexity = environmentalScore.modifiedAttackComplexity.value
                    request.modifiedPrivilegesRequired = environmentalScore.modifiedPrivilegesRequired.value
                    request.modifiedUserInteraction = environmentalScore.modifiedUserInteraction.value
                    request.modifiedScope = environmentalScore.modifiedScope.value
                    request.modifiedConfidentiality = environmentalScore.modifiedConfidentiality.value
                    request.modifiedIntegrity = environmentalScore.modifiedIntegrity.value
                    request.modifiedAvailability = environmentalScore.modifiedAvailability.value
                    
                    calculatorViewModel.sendRequestToAPI()
                }
            }
        }
    }
}

struct EnvironmentalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        EnvironmentalScoreView(request: .constant(CVSSAPIRequest()), overallScore: .constant(nil))
    }
}
