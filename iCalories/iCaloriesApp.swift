//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Omid Shojaeian Zanjani on 06/05/23.
//

import SwiftUI
// startin project in 17:09 - May 06 Saturday
@main
struct iCaloriesApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
