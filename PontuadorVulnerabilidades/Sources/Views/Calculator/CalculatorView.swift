//
//  CalculatorView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    @Binding var baseScore: BaseScore?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                BaseScoreView(baseScore: $baseScore, request: $viewModel.request, overallScore: $viewModel.result)
                    .environmentObject(viewModel)
                
                TemporalScoreView(request: $viewModel.request, overallScore: $viewModel.result)
                    .environmentObject(viewModel)
                
                EnvironmentalScoreView(request: $viewModel.request, overallScore: $viewModel.result)
                    .environmentObject(viewModel)
                
                Spacer()
            }
            .padding(.all, 26)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalculatorView(baseScore: .constant(nil))
    }
}
