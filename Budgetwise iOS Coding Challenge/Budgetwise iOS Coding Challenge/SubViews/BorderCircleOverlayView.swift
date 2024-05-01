//
//  ButtonView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/28/24.
//

import Foundation
import SwiftUI

//This code represents the + ciruclar button, that is programmed entirely to represent it.
struct BorderCircleOverlayView : View {
    var color_values: [Color] = [.green, .red, .init(r: 91, g: 98, b: 205), .yellow, .blue]
    var progress_values = [0.25, 0.375, 0.5, 0.625, 1.0]

    var body: some View {
        ZStack {
            Image(.plus)
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.white)
              .padding(20)
              .background(Color.white)
              .clipShape(Circle())
                .shadow(color: .black, radius: 3, x: 0, y: 5)
            
            ForEach(0..<progress_values.count, id: \.self) { index in
                let from = (index == 0) ? 0.0 : progress_values[index - 1]
                let to = progress_values[index]
                Circle()
                    .trim(from: from, to: to)
                    .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .butt, lineJoin: .miter))
                    .foregroundColor(color_values[index])
                    .rotationEffect(Angle(degrees: 270))
            }
        }
    }
}
