//
//  PrivilegesRequiredPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct PrivilegesRequiredPicker: View {
    
    @Binding var selectedValue: PrivilegesRequired
    
    var body: some View {
        VStack {
            Picker("Privilégios Necessários (PR)", selection: $selectedValue) {
                ForEach(PrivilegesRequired.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct PrivilegesRequiredPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        PrivilegesRequiredPicker(selectedValue: .constant(.none))
    }
}
