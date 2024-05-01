//
//  ProgressbarBudgetView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/30/24.
//

import Foundation
import SwiftUI

//Green Progress bar in header view
struct ProgressBarBudgetView: View {
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: geometry.size.width, height: 40)
                    .foregroundStyle(.placeholder)
                
                Rectangle()
                    .frame(width: progress * geometry.size.width , height: 40)
                    .foregroundStyle(Color(r: 83, g: 189, b: 113))
                    .clipShape(.rect(topLeadingRadius: 15, bottomLeadingRadius: 15, bottomTrailingRadius: 0, topTrailingRadius: 0))
            }
        }.frame(height: 40)
    }
}

