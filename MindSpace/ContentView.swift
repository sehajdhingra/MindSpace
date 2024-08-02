//
//  ContentView.swift
//  MindSpaceProject
//
//  Created by SriSai on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeScreen().tabItem {
                    Image(systemName: "house.fill")
                    Text("Home Screen")
                }
                
                CalendarScreen().tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
                
                Mental().tabItem {
                    Image(systemName: "heart.fill")
                    Text("Mental Health")
                }
            }
            // .accentColor(Color(hex: "FDA758"))
        }
    }
}

struct ContentScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EventStore(preview: true))
    }
}
