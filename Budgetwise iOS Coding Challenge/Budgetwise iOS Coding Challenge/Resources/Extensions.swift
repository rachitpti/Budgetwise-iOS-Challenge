//
//  Extensions.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/26/24.
//

import Foundation
import SwiftUI

//This is present to make to code declarations easy to enhance readability in a decoupled fashion

extension Color { //Since figma UI had custom colors thus to represent R,G,B values in Swift code in an easy way
    init(r: Int, g: Int, b: Int, opacity: CGFloat = 1.0) {
        self.init(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0, opacity: Double(opacity))
    }
}

//Default value representation in float is 1.7900000000 below method reduces it to 1.79
extension Float {
    func removeTrailingZeroesInDecimal() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return String(formatter.string(from: number) ?? "")
    }
}
