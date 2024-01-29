//
//  AdaptiveSwitchDataController.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/27/24.
//

import CoreData
import Foundation

class AdaptiveSwitchDataController: ObservableObject {
    let container = NSPersistentContainer(name: "AdaptiveSwitchTable")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
