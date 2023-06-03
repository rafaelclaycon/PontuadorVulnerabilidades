//
//  UserInteractionPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct UserInteractionPicker: View {
    
    @Binding var selectedValue: UserInteraction
    
    var body: some View {
        VStack {
            Picker("Interação do Usuário (UI)", selection: $selectedValue) {
                ForEach(UserInteraction.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct UserInteractionPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        UserInteractionPicker(selectedValue: .constant(.none))
    }
}
