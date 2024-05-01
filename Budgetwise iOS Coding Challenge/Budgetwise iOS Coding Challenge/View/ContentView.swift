//
//  ContentView.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    
    //Using UIKit modifiers to implement changes at all levels to reduce redundancy in SwiftUI declarations
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "AvenirNext-Regular", size: 15)! ], for: .normal)
    }
    
    
    var body: some View {
        //Tabbar code
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(.home) //.home is a notation to call images by there name without enclosing them into ""
                        Text("Home")
                            .font(Font.custom("AvenirNext-Regular", size: 20))
                    }
                TrendsView()
                    .tabItem {
                        Image(.trends)
                        Text("Trends")
                            .font(Font.custom("AvenirNext-Regular", size: 20))
                        
                    }
                TransactionsView()
                    .tabItem {
                        Image(.transactions)
                        Text("Transactions")
                            .font(Font.custom("AvenirNext-Regular", size: 20))
                        
                    }
                CommunityView()
                    .tabItem {
                        Image(.community)
                        Text("Community")
                            .font(Font.custom("AvenirNext-Regular", size: 20))
                        
                    }
                ProfileView()
                    .tabItem {
                        Image(.profile)
                        Text("Profile")
                            .font(Font.custom("AvenirNext-Regular", size: 20))
                        
                    }
            }.shadow(radius: 10)
        }
    }
}

#Preview {
    ContentView()
}


