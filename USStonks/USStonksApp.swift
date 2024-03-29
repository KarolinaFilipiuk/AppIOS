//
//  USStonksApp.swift
//  USStonks
//
//  Created by Guest User on 06/01/2023.
//

import SwiftUI

@main
struct USStonksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
