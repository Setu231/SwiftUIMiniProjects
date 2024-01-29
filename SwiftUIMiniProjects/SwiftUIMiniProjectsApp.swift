//
//  SwiftUIMiniProjectsApp.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/22/24.
//

import SwiftUI
import CoreData

@main
struct SwiftUIMiniProjectsApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            AdaptiveSwitchCaseView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
