//
//  HomeView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/26/24.
//

import SwiftUI

//Contains the homepage UI and logic associated with it
struct HomeView: View {
    
      @State private var showModal = false //to load the items shown in figma view for just one time
      @State private var amountToAllocate: String = "" //budget to be allocated for that category
      @State private var amountToAdd: String = "" //added amount that is spent on that category
      @State private var expenseName: String = "" //name of expense
        @State private var expense : Item? = nil //representation of the expense in the codebase which is of type Item
    
   
    var body: some View {
        ZStack {
            VStack {
                //Blue UI in the back
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: UIScreen.main.bounds.height * 0.23)
                    .foregroundStyle(Color(r: 101, g: 154, b: 235, opacity: 1))
                    .offset(x: 0, y: -20)
                Spacer()
            }.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack {
                    //navbar UI
                    HStack {
                        Button(action: {}, label: {
                            Image(.hamburgerMenu)
                                .resizable()
                                .frame(width: 29, height: 29)
                                .padding(.trailing)
                        })
                        
                        Spacer()
    
                        Text("April 2022")
                            .font(Font.custom("AvenirNext-Bold", size: 17))
                            .foregroundStyle(.white)
                            .padding(.trailing, -5)
                            .frame(alignment: .center)
                        
                        Button(action: {}, label: {
                            Image(.down)
                                .resizable()
                                .frame(width: 35, height: 35)
                        })
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(.share)
                                .resizable()
                                .frame(width: 24, height: 25)
                        }
                        
                        Button(action: {}) {
                            Image(.dotMenu)
                                .resizable()
                                .frame(width: 26, height: 26)
                        }
                    }.padding()
                        .padding(.top, -10) //end of navbar UI
                    
                    
                    Spacer(minLength: 3)
                    
                    //BudgetView stats UI, it's enclosed in this class to enhance modularity in the codebase.
                    BudgetBreakdownView(expense: $expense)
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                }
            }
            .scrollClipDisabled()
            .scrollIndicators(.hidden, axes: .vertical)
 
            //Add transaction button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button  {
                        showModal = true
                    } label: {
                        BorderCircleOverlayView() //contains the rendering logic of the + button
                            .frame(width: 56, height: 56)
                            .padding(.bottom, 20)
                            .padding(.trailing, 27)
                    }
                }
            }
            
            if showModal {
                            // Background overlay
                            Color.black.opacity(0.4)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showModal = false
                                }

                            // Popup view
                            VStack(spacing: 20) {
                                TextField("Name of the Expense", text: $expenseName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()

                                TextField("Amount to Allocate", text: $amountToAllocate)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .keyboardType(.decimalPad)

                                TextField("Amount to Add", text: $amountToAdd)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .keyboardType(.decimalPad)

                                Button("Save") {
                                    // Handle the save action
                                    expense = Item(name: expenseName, imageIcon: "food", theme: .fromColor(.green), amt_allocated: Float(amountToAllocate) ?? 0, amt_added: Float(amountToAdd) ?? 0)
                                    showModal = false
                                }
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .frame(width: 300)
                        }
        } //zstack ends here.
        .background(.white)
        
      
    }
    
    
    
  
}




#Preview {
    HomeView()
}
