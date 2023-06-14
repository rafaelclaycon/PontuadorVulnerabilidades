//
//  CAPECView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CAPECView: View {
    
    @State var capec: CAPEC
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text(capec.id)
                
                Text(capec.name)
                    .bold()
            }
            
            Text(capec.summary)
                .lineLimit(2)
            
            
        }
        .padding(.vertical)
    }
}

struct CAPECView_Previews: PreviewProvider {
    
    static var previews: some View {
        CAPECView(capec: CAPEC(id: "76", name: "Manipulating Web Input to File System Calls", prerequisites: "Program must allow for user controlled variables to be applied directly to the filesystem", related_weakness: ["15", "22", "23", "264"], solutions: "Design: Enforce principle of least privilege. Design: Ensure all input is validated, and does not contain file system commands Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands. Design: For interactive user applications, consider if direct file system interface is necessary, instead consider having the application proxy communication. Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables.", summary: "An attacker manipulates inputs to the target software which the target software passes to file system calls in the OS. The goal is to gain access to, and perhaps modify, areas of the file system that the target software did not intend to be accessible."))
    }
}
