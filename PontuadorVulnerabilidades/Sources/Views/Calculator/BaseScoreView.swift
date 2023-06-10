//
//  BaseScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct BaseScoreView: View {
    
    @Binding var overallScore: CVSSAPIResponse?
    @Binding var request: CVSSAPIRequest
    
    
    
    @State private var attackVector: AttackVector = .network
    @State private var attackComplexity: AttackComplexity = .low
    @State private var privilegesRequired: PrivilegesRequired = .none
    @State private var userInteraction: UserInteraction = .none
    
    @State private var scope: Scope = .unchanged
    @State private var confidentiality: Confidentiality = .none
    @State private var integrity: Integrity = .none
    @State private var availability: Availability = .none
    
    private var baseScore: String {
        guard let overallScore = overallScore else { return "" }
        return "\(overallScore.baseScore)"
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Pontuação Básica")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Text(baseScore)
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
            }
            
            HStack(spacing: 30) {
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $attackVector, pickerTitle: "Vetor de Ataque (AV)")
                    
                    ScorePickerView(selectedValue: $attackComplexity, pickerTitle: "Complexidade do Ataque (AC)")
                    
                    ScorePickerView(selectedValue: $privilegesRequired, pickerTitle: "Privilégios Necessários (PR)")
                    
                    ScorePickerView(selectedValue: $userInteraction, pickerTitle: "Interação do Usuário (UI)")
                }
                
                VStack(spacing: 40) {
                    ScorePickerView(selectedValue: $scope, pickerTitle: "Escopo (S)")
                    
                    ScorePickerView(selectedValue: $confidentiality, pickerTitle: "Confidencialidade (C)")
                    
                    ScorePickerView(selectedValue: $integrity, pickerTitle: "Integridade (I)")
                    
                    ScorePickerView(selectedValue: $availability, pickerTitle: "Disponibilidade (A)")
                }
            }
            
            Button("Calcular Pontuação Básica") {
                request.attackVector = attackVector.value
                sendRequestToAPI()
            }
        }
    }
    
    private func sendRequestToAPI() {
        Task {
            let url = URL(string: "https://127.0.0.1:5000/calculate-cvss")!
            
            do {
                let response: CVSSAPIResponse = try await Networking.post(to: url, body: request)
                print(response)
                overallScore = response
            } catch {
                print(error)
            }
        }
    }
}

struct BaseScoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        BaseScoreView(overallScore: .constant(nil), request: .constant(CVSSAPIRequest()))
    }
}
