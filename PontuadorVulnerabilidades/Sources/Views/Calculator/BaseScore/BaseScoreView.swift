//
//  BaseScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct BaseScoreView: View {
    
    @State private var basicScore: String = ""
    
    @State private var attackVector: AttackVector = .network
    @State private var attackComplexity: AttackComplexity = .low
    @State private var privilegesRequired: PrivilegesRequired = .none
    @State private var userInteraction: UserInteraction = .none
    
    @State private var scope: Scope = .unchanged
    @State private var confidentiality: Confidentiality = .none
    @State private var integrity: Integrity = .none
    @State private var availability: Availability = .none
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Básica")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Text(basicScore)
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
            }
            
            HStack(spacing: 30) {
                VStack(spacing: 40) {
                    AttackVectorScorePicker(selectedValue: $attackVector)
                    
                    AttackComplexityPicker(selectedValue: $attackComplexity)
                    
                    PrivilegesRequiredPicker(selectedValue: $privilegesRequired)
                    
                    UserInteractionPicker(selectedValue: $userInteraction)
                }
                
                VStack(spacing: 40) {
                    ScopePicker(selectedValue: $scope)
                    
                    ConfidentialityPicker(selectedValue: $confidentiality)
                    
                    IntegrityPicker(selectedValue: $integrity)
                    
                    AvailabilityPicker(selectedValue: $availability)
                }
            }
            
            Button("Calcular Pontuação Básica") {
                basicScore = "5.9"
            }
        }
    }
}

struct BaseScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        BaseScoreView()
    }
}
