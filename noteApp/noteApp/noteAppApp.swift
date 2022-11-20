//
//  noteAppApp.swift
//  noteApp
//
//  Created by  illia on 12/11/2022.
//

import SwiftUI

@main
struct noteAppApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
