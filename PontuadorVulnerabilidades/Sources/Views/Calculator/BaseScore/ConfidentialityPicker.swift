//
//  ConfidentialityPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct ConfidentialityPicker: View {
    
    @Binding var selectedValue: Confidentiality
    
    var body: some View {
        VStack {
            Picker("Confidencialidade (C)", selection: $selectedValue) {
                ForEach(Confidentiality.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct ConfidentialityPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        ConfidentialityPicker(selectedValue: .constant(.none))
    }
}
