//
//  StackedDataView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 13/06/23.
//

import SwiftUI

struct StackedDataView: View {
    
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(title.uppercased())
                .font(.callout)
                .foregroundColor(.gray)
            
            HStack {
                Text(value)
                    .font(.title2)
                    .bold()
            }
        }
    }
}

struct StackedDataView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StackedDataView(title: "Baixados", value: "8")
                .previewLayout(.fixed(width: 200, height: 100))
            StackedDataView(title: "Espaço ocupado", value: "768,6 MB")
                .previewLayout(.fixed(width: 200, height: 100))
            StackedDataView(title: "Última consulta", value: "22/01/2022")
                .previewLayout(.fixed(width: 200, height: 100))
        }
    }
}
