//
//  ScorePickerView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct ScorePickerView<EnumType: CaseIterable & Hashable & CustomStringConvertible>: View where EnumType.AllCases: RandomAccessCollection {
    
    @Binding var selectedValue: EnumType
    var pickerTitle: String
    
    var body: some View {
        VStack {
            Picker(pickerTitle, selection: $selectedValue) {
                ForEach(EnumType.allCases, id: \.self) { enumCase in
                    Text(enumCase.description).tag(enumCase)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct ScorePickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScorePickerView<AttackVector>(selectedValue: .constant(.network), pickerTitle: "Vetor de Ataque")
    }
}
