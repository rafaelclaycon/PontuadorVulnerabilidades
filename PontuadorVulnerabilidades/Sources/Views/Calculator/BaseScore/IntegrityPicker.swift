//
//  IntegrityPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct IntegrityPicker: View {
    
    @Binding var selectedValue: Integrity
    
    var body: some View {
        VStack {
            Picker("Integridade (I)", selection: $selectedValue) {
                ForEach(Integrity.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct IntegrityPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        IntegrityPicker(selectedValue: .constant(.none))
    }
}
