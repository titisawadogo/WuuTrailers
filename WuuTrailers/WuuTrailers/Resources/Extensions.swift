//
//  Extensions.swift
//  WuuTrailers
//
//  Created by Tindwende Thierry Sawadogo on 8/29/22.
//

import Foundation



// pour faire la premiere lettre sera en majiscyle et le reste sera en minuscule
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
