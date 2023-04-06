//
//  Extensions.swift
//  Netflix
//
//  Created by Thiago Pereira on 06/04/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
