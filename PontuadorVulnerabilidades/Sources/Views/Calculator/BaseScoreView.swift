//
//  BaseScoreView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct BaseScoreView: View {
    
    @Binding var baseScore: BaseScore?
    @Binding var overallScore: CVSSAPIResponse?
    @Binding var request: CVSSAPIRequest
    
//    @State private var attackVector: AttackVector = .network
//    @State private var attackComplexity: AttackComplexity = .low
//    @State private var privilegesRequired: PrivilegesRequired = .none
//    @State private var userInteraction: UserInteraction = .none
//
//    @State private var scope: Scope = .unchanged
//    @State private var confidentiality: Confidentiality = .none
//    @State private var integrity: Integrity = .none
//    @State private var availability: Availability = .none
    
    @State var unwrappedBaseScore = BaseScore()
    
    private var baseScoreText: String {
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
                
                Text(baseScoreText)
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
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
                request.attackVector = unwrappedBaseScore.attackVector.value
                sendRequestToAPI()
            }
        }
        .onAppear {
            guard let baseScore = baseScore else { return }
            unwrappedBaseScore = baseScore
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
        BaseScoreView(baseScore: .constant(nil), overallScore: .constant(nil), request: .constant(CVSSAPIRequest()))
    }
}
