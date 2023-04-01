//
//  DevoteApp.swift
//  Devote
//
//  Created by Ashish Yadav on 31/03/23.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
