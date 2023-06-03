//
//  ScopePicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct ScopePicker: View {
    
    @Binding var selectedValue: Scope
    
    var body: some View {
        VStack {
            Picker("Escopo (S)", selection: $selectedValue) {
                ForEach(Scope.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct ScopePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        ScopePicker(selectedValue: .constant(.unchanged))
    }
}
