//
//  AttackComplexityPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct AttackComplexityPicker: View {
    
    @Binding var selectedValue: AttackComplexity
    
    var body: some View {
        VStack {
            Picker("Complexidade do Ataque (AC)", selection: $selectedValue) {
                ForEach(AttackComplexity.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct AttackComplexityPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        AttackComplexityPicker(selectedValue: .constant(.low))
    }
}
