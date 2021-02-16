//
//  ScorchTimeApp.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//

import SwiftUI

@main
struct ScorchTimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
