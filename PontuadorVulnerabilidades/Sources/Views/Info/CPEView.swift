//
//  CAPECView.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 03/06/23.
//

import SwiftUI

struct CPEView: View {
    
    @State var cve: [CVEcpeMatch]?
    
    var body: some View {

            VStack(spacing: 15) {
                ForEach(cve!) { cpe in
                    
                    StackedCPEView(title: "ID", value: cpe.matchCriteriaId)
                    StackedCPEView(title: "CRITERIA", value: cpe.criteria)
                    StackedCPEView(title: "VERSION", value: cpe.versionEndExcluding)
                    
                    Spacer()
                }
            }
            
        }
    }

//      .padding(.vertical)
//  }

//struct CCPEView_Previews: PreviewProvider {
//
////    static var previews: some View {
////        CPEView(cve: [CVEcpeMatch]?(id: "76", name: "Manipulating Web Input to File System Calls", prerequisites: "Program must allow for user controlled variables to be applied directly to the filesystem", related_weakness: ["15", "22", "23", "264"], solutions: "Design: Enforce principle of least privilege. Design: Ensure all input is validated, and does not contain file system commands Design: Run server interfaces with a non-root account and/or utilize chroot jails or other configuration techniques to constrain privileges even if attacker gains some limited access to commands. Design: For interactive user applications, consider if direct file system interface is necessary, instead consider having the application proxy communication. Implementation: Perform testing such as pen-testing and vulnerability scanning to identify directories, programs, and interfaces that grant direct access to executables.", summary: "An attacker manipulates inputs to the target software which the target software passes to file system calls in the OS. The goal is to gain access to, and perhaps modify, areas of the file system that the target software did not intend to be accessible."))
////    }
