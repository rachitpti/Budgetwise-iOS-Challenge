//
//  ItemModel.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/30/24.
//

import Foundation
import SwiftData
import SwiftUI

//Item model which is a representation of an expense and is declared inside SwiftData (the latest framework launched by Apple to persist data locally in WWDC23)
@Model
class Item: Identifiable, Equatable {
    var id = UUID()
    var name : String
    var imageIcon: String
    var theme: ColorComponents
    var amt_allocated: Float
    var amt_added: Float
    
    init(id: UUID = UUID(), name: String, imageIcon: String, theme: ColorComponents, amt_allocated: Float, amt_added: Float) {
        self.id = id
        self.name = name
        self.imageIcon = imageIcon
        self.theme = theme
        self.amt_allocated = amt_allocated
        self.amt_added = amt_added
    }
}


//This is the representation of the Color code in this codebase, since Color type cannot be directly stored in any persistance framework.
//Leverages representation by r,g,b values.
public struct ColorComponents: Codable {
    let red: Float
    let green: Float
    let blue: Float
    
    //API property to represent color by Color type
    var color: Color {
        Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    //API method to represent rgb from Color type
    static func fromColor(_ color: Color) -> ColorComponents {
        let resolved = color.resolve(in: EnvironmentValues())
        return ColorComponents(
            red: resolved.red,
            green: resolved.green,
            blue: resolved.blue
        )
    }
}
