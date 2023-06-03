//
//  CVEInfoView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CVEInfoView: View {
    
    @Binding var cveReponse: CVEResponse?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if cveReponse != nil {
                HStack {
                    Text(cveReponse?.id ?? "")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                
                HStack {
                    Text("DESCRIÇÃO")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                Text(cveReponse?.summary ?? "")
                
                HStack {
                    Text("CAPECs")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                ForEach(cveReponse!.capec) { capec in
                    CAPECView(capec: capec)
                }
            }
            
            Spacer()
        }
    }
}

struct CVEInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        CVEInfoView(cveReponse: .constant(nil))
    }
}
