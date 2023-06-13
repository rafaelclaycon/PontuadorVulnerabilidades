//
//  ProcessingView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 13/06/23.
//

import SwiftUI

struct ProcessingView: View {
    
    @State var message: String
    @State var progressViewYOffset: CGFloat = -15
    @State var progressViewWidth: CGFloat = 200
    @State var messageYOffset: CGFloat = 26
    
    var body: some View {
        ZStack {
            ProgressView()
                //.scaleEffect(2, anchor: .center)
                .frame(width: progressViewWidth, height: 130)
                .offset(x: 0, y: progressViewYOffset)
                .background(.regularMaterial)
                .cornerRadius(25)
            
            Text(message)
                .offset(x: 0, y: messageYOffset)
                .multilineTextAlignment(.center)
        }
    }
}

struct ProcessingView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProcessingView(message: "Consultando dados...")
    }
}
