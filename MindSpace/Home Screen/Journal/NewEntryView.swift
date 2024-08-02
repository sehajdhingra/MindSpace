//
//  NewEntryView.swift
//  FinalProject
//
//  Created by Nadia Begum on 01/08/2024.
//

import SwiftUI
import SwiftData


struct NewEntryView: View {
    @Bindable var EntryItem: EntryItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewEntry: Bool
    
    var body: some View {
        VStack {
            Text("Entry: ")
                .font(.title)
                .fontWeight(.bold)
                .offset(x: -130)
                .offset(y: 25)
            TextField("Enter here...", text: $EntryItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
            Button {
                addEntry()
                self.showNewEntry = false
            } label: {
                Image("saveButton")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .offset(y: -15)
            }

        }
    }
    
    func addEntry() {
        let entry = MindSpace.EntryItem(title: EntryItem.title)
        modelContext.insert(entry)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: EntryItem.self, configurations: config)

    let entry = EntryItem(title: "Example Entry", isImportant: false)
    return NewEntryView(EntryItem: entry, showNewEntry: .constant(true))
        .modelContainer(container)
}
