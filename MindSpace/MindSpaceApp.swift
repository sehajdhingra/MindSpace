//
//  MindSpaceApp.swift
//  MindSpace
//
//  Created by Umang Dhingra on 8/2/24.
//

import SwiftUI

@main
struct MindSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ToDoItem.self, EntryItem.self])
                .environmentObject(EventStore(preview: true))
        }
    }
}
