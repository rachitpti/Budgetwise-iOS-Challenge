//
//  BudgetBreakdownView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/29/24.
//

import SwiftUI
import SwiftData

struct BudgetBreakdownView: View {
    
    @Binding var expense: Item? //property to fetch the data from the parent view / Home screen
    @Environment(\.modelContext) private var context //instance of the persistent model
    @Query var itemsArray: [Item] //property which holds the storage of the items
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack  {
                //Blue rectangle in the back
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding(.bottom, -15)
                
                //Header View
                VStack(spacing: 0) {
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("$\(calculateRemainingbudget().removeTrailingZeroesInDecimal())")
                            .font(Font.custom("AvenirNext-Bold", size: 40))
                            .foregroundColor(.green)
                        
                        Text("Remaining in Budget").font(Font.custom("AvenirNext-Bold", size: 15)).foregroundColor(.secondary)
                        
                        //Representing statistics and it's calculation
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Spent")
                                    .font(Font.custom("AvenirNext-Bold", size: 15))
                                    .foregroundColor(.secondary)
                                
                                Text("$\(itemsArray.map({ $0.amt_added }).reduce(0, +).removeTrailingZeroesInDecimal())") //API to add the elements in the array and prune the truncating decimal zeroes.
                                    .font(Font.custom("AvenirNext-Medium", size: 20))
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Budget")
                                    .font(Font.custom("AvenirNext-Bold", size: 15))
                                    .foregroundColor(.secondary)
                                
                                Text("$\(itemsArray.map({ $0.amt_allocated }).reduce(0, +).removeTrailingZeroesInDecimal())")
                                    .font(Font.custom("AvenirNext-Medium", size: 20))
                                    .foregroundColor(.black)
                            }
                            
                        }.padding(.leading, 40)
                            .padding(.trailing, 40)
                        
                        //progress bar which monitors the budget expenditure.
                        ProgressBarBudgetView(progress: calculateBudget())
                            .padding()
                        
                    }.padding(.top, 20)
                    
                    //rendering of the categories in the budget
                    VStack(spacing: 0) {
                        ForEach(itemsArray, id: \.id) { item in
                            ListItemView(name: item.name, theme: item.theme, amt_allocated: item.amt_allocated, amt_added: item.amt_added, imageName: item.imageIcon)
                        }
                    }.onAppear{
                        loadDummyItems() //load the data present in figma to match the view
                    }.onChange(of: expense) {
                        addItem() //adding the new expense and add to existing list
                    }
                }
            }
            
        }.scrollClipDisabled()
        
    }
    
    
    //code to add expenses
    func addItem () {
        if let expense = expense {
            context.insert(expense)
        }
    }
    
    //below methods to represent statistics in HeaderView (aka amount indicating the budget in $
    func calculateRemainingbudget() -> Float {
        let total_amt_allocated =  itemsArray.map({ $0.amt_allocated }).reduce(0, +)
        let total_amt_added =  itemsArray.map({ $0.amt_added }).reduce(0, +)
        return total_amt_allocated - total_amt_added
    }
    
    func calculateBudget() -> CGFloat {
        let total_amt_allocated =  itemsArray.map({ $0.amt_allocated }).reduce(0, +)
        let total_amt_added =  itemsArray.map({ $0.amt_added }).reduce(0, +)
        let percentage  = total_amt_added / total_amt_allocated
        
        if total_amt_allocated == 0 {
            return CGFloat.zero
        } else {
            return CGFloat(percentage)
        }
    }
    
    //loading items to emulate the figma designs
    func loadDummyItems() {
        let itemArray = [
            Item(name: "Food", imageIcon: "food", theme: ColorComponents.fromColor(Color(r: 33, g: 59, b: 128)), amt_allocated: 100, amt_added: 10),
            Item(name: "Shopping", imageIcon: "shopping", theme: ColorComponents.fromColor(Color(r: 56, g: 107, b: 188)), amt_allocated: 100, amt_added: 20),
            Item(name: "Transportation", imageIcon: "transportation", theme: ColorComponents.fromColor(Color(r: 255, g: 185, b: 0)), amt_allocated: 100, amt_added: 20),
            Item(name: "Education", imageIcon: "education", theme: ColorComponents.fromColor(Color(r: 70, g: 189, b: 198)), amt_allocated: 100, amt_added: 40),
            Item(name: "Groceries", imageIcon: "groceries", theme: ColorComponents.fromColor(Color(r: 0, g: 188, b: 56)), amt_allocated: 200, amt_added: 130),
            Item(name: "Housing", imageIcon: "housing", theme: ColorComponents.fromColor(Color(r: 255, g: 55, b: 60)), amt_allocated: 5654, amt_added: 5654)
        ]
        
        //load only once since it's getting stored locally
        if itemsArray.isEmpty {
            itemArray.forEach { item in
                context.insert(item)
            }
        }
        
    }
}

#Preview {
    BudgetBreakdownView(expense: .constant(nil))
}
