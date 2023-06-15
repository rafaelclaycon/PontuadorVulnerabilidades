//
//  CPEView.swift
//  PontuadorVulnerabilidades
//
//  Created by Eduardo Diehl on 14/06/23.
//

import SwiftUI

struct CPEView: View {
    
    let cpe: CVECPEMatch
    
    var vulnerableText: String {
        cpe.vulnerable ? "Sim" : "Não"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(cpe.criteria)
                .bold()
            
            Text("Vulnerável? \(vulnerableText)")
            
            Text("Primeira versão não vulnerável: \(cpe.versionEndExcluding)")
            
            Text("Match Criteria ID: \(cpe.matchCriteriaId)")
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray).opacity(0.1))
    }
}

struct CPEView_Previews: PreviewProvider {
    
    static var previews: some View {
        CPEView(cpe: CVECPEMatch(vulnerable: true,
                                        criteria: "cpe:2.3:a:whatsapp:whatsapp:*:*:*:*:*:tizen:*:*",
                                        versionEndExcluding: "2.18.15",
                                        matchCriteriaId: "49A0C7E5-1C25-4EA2-9436-A7922ACACB9B"))
    }
}
