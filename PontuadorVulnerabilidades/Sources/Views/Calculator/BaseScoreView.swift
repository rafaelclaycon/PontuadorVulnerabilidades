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
    
    @State var unwrappedBaseScore = BaseScore()
    
    private var baseScoreNumber: String {
        guard let overallScore = overallScore else { return "" }
        return "\(overallScore.baseScore)"
    }
    
    private var baseScoreText: String {
        guard let overallScore = overallScore else { return "" }
        switch overallScore.baseSeverity.uppercased() {
        case "NONE":
            return "NENHUMA"
        case "LOW":
            return "BAIXA"
        case "MEDIUM":
            return "MÉDIA"
        case "HIGH":
            return "ALTA"
        case "CRITICAL":
            return "CRÍTICA"
        default:
            return overallScore.baseSeverity.uppercased()
        }
    }
    
    private var scoreColor: Color {
        guard let overallScore = overallScore else { return .yellow }
        switch overallScore.baseScore {
        case 0..<4:
            return .green
        case 4..<7:
            return .yellow
        case 7..<9:
            return .orange
        default:
            return .red
        }
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
        sendRequestToAPI()
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
