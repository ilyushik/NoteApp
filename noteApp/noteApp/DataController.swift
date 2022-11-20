//
//  DataController.swift
//  noteApp
//
//  Created by  illia on 12/11/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Notes")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
