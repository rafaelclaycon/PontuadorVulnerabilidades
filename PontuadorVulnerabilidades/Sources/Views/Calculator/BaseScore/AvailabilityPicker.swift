//
//  AvailabilityPicker.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct AvailabilityPicker: View {
    
    @Binding var selectedValue: Availability
    
    var body: some View {
        VStack {
            Picker("Disponibilidade (A)", selection: $selectedValue) {
                ForEach(Availability.allCases, id: \.self) {
                    Text($0.description).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 500)
        }
    }
}

struct AvailabilityPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        AvailabilityPicker(selectedValue: .constant(.none))
    }
}
