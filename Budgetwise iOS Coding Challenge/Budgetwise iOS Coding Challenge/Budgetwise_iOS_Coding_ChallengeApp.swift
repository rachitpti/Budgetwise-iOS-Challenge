//
//  Budgetwise_iOS_Coding_ChallengeApp.swift
//  Budgetwise iOS Coding Challenge
//
//  Created by Rachit Prajapati on 4/26/24.
//

import SwiftUI
import SwiftData


@main
struct Budgetwise_iOS_Coding_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self) //declaration of persistance system into the app level as a container
        
    }
}
