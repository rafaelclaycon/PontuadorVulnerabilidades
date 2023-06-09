//
//  EnvironmentalScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct EnvironmentalScoreView: View {
    
    @State private var confidentialityRequirement: ConfidentialityRequirement = .notDefined
    @State private var integrityRequirement: IntegrityRequirement = .notDefined
    @State private var availabilityRequirement: AvailabilityRequirement = .notDefined
    
    @State private var modifiedAttackVector: ModifiedAttackVector = .notDefined
    @State private var modifiedAttackComplexity: ModifiedAttackComplexity = .notDefined
    @State private var modifiedPrivilegesRequired: ModifiedPrivilegesRequired = .notDefined
    @State private var modifiedUserInteraction: ModifiedUserInteraction = .notDefined
    @State private var modifiedScope: ModifiedScope = .notDefined
    @State private var modifiedConfidentiality: ModifiedConfidentiality = .notDefined
    @State private var modifiedIntegrity: ModifiedIntegrity = .notDefined
    @State private var modifiedAvailability: ModifiedAvailability = .notDefined
    
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
            
            HStack(spacing: 30) {
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $confidentialityRequirement, pickerTitle: "Requisito de Confidencialidade (CR)")
                    
                    ScorePickerView(selectedValue: $integrityRequirement, pickerTitle: "Requisito de Integridade (IR)")
                    
                    ScorePickerView(selectedValue: $availabilityRequirement, pickerTitle: "Requisito de Disponibilidade (AR)")
                    
                    Spacer()
                }
                
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $modifiedAttackVector, pickerTitle: "Vetor de Ataque Modificado (MAV)")
                    
                    ScorePickerView(selectedValue: $modifiedAttackComplexity, pickerTitle: "Complexidade do Ataque Modificada (MAC)")
                    
                    ScorePickerView(selectedValue: $modifiedPrivilegesRequired, pickerTitle: "Privilégios Necessários Modificados (MPR)")
                    
                    ScorePickerView(selectedValue: $modifiedUserInteraction, pickerTitle: "Interação do Usuário Modificada (MUI)")
                    
                    ScorePickerView(selectedValue: $modifiedScope, pickerTitle: "Escopo Modificado (MS)")
                    
                    ScorePickerView(selectedValue: $modifiedConfidentiality, pickerTitle: "Confidencialidade Modificada (MC)")
                    
                    ScorePickerView(selectedValue: $modifiedIntegrity, pickerTitle: "Integridade Modificada (MI)")
                    
                    ScorePickerView(selectedValue: $modifiedAvailability, pickerTitle: "Disponibilidade Modificada (MA)")
                }
            }
            
            Button("Calcular Pontuação Ambiental") {
                //sendRequestToAPI()
            }
        }
    }
}

struct EnvironmentalScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        EnvironmentalScoreView()
    }
}
