//
//  AttackVectorScorePicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct AttackVectorScorePicker: View {
    
    @Binding var selectedValue: AttackVector
    
    var body: some View {
        VStack {
            Picker("Vetor de Ataque (AV)", selection: $selectedValue) {
                ForEach(AttackVector.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct AttackVectorScorePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        AttackVectorScorePicker(selectedValue: .constant(.network))
    }
}
