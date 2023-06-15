//
//  StackedCPEView.swift
//  PontuadorVulnerabilidades
//
//  Created by Eduardo Diehl on 14/06/23.
//

import SwiftUI

struct StackedCPEView: View {
    
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(title.uppercased())
                .bold()
            
            HStack {
                Text(value)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
    }
}
