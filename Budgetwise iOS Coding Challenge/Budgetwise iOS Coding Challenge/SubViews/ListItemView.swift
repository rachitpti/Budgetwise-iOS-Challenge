//
//  ListItemView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/29/24.
//

import SwiftUI

//A reusable custom SwiftUI view which will represent the expenditure/category in the budeget
struct ListItemView: View {
    let name: String
    let theme: ColorComponents //refer ItemModel.swift for more info
    let amt_allocated: Float
    let amt_added: Float
    let imageName: String 
    
    var body: some View {
        
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.placeholder)
            
            Spacer(minLength: 15)
            HStack {
                HStack(spacing: 12) {
                    Image(imageName)
                        .resizable()
                        .foregroundStyle(.placeholder)
                        .frame(width: 36, height: 36)
                    
                    Text(name)
                        .font(Font.custom("AvenirNext-Medium", size: 17))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("$\(Text("\(amt_added.removeTrailingZeroesInDecimal())").foregroundStyle(.green)) of $\(amt_allocated.removeTrailingZeroesInDecimal())")
                        .font(Font.custom("AvenirNext-Medium", size: 17))
                        .foregroundStyle(.gray)
                    
                    Text("$\(amtLeft()) left")
                        .font(Font.custom("AvenirNext-Medium", size: 12))
                        .foregroundStyle(.gray)
                    
                }
            }.padding(.leading, 14)
                .padding(.trailing, 14)
            
            Spacer(minLength: 15)
            
            //Progress bar indicating how much money is left for that category specifically
            ProgressBarItemView(progress: CGFloat((amt_added/amt_allocated)), theme: theme)
            
        }
    }
    
    //To represent the statistics in the right side of the view
    func amtLeft() -> String {
        let value = amt_allocated - amt_added
        return value.removeTrailingZeroesInDecimal()
    }
    
}

//Code for progress bar indicating how much money is left for that category specifically
struct ProgressBarItemView: View {
    let progress: CGFloat
    let theme: ColorComponents
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 8)
                    .foregroundStyle(.placeholder)
                
                Rectangle()
                    .frame(width: progress * geometry.size.width , height: 8)
                    .foregroundStyle(theme.color)
            }
        }
    }
}

#Preview {
    ListItemView(name: "Demo", theme: .fromColor(.brown), amt_allocated: 100, amt_added: 10, imageName: "food")
}
