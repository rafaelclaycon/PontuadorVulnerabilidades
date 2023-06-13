//
//  String+Extensions.swift
//  PontuadorVulnerabilidades
//
//  Created by Rafael Schmitt on 13/06/23.
//

import Foundation

extension String {
    
    func toScreenString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let date = dateFormatter.date(from: self)

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd/MM/yyyy" // HH:mm
        return outputDateFormatter.string(from: date!)
    }
}
