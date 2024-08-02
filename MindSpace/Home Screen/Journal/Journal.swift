//
//  Journal.swift
//  FinalProject
//
//  Created by Nadia Begum on 30/07/2024.
//

import SwiftUI
import SwiftData

struct Journal: View {
    @State private var showNewEntry = false
    @Query var entry: [EntryItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("Add an entry")
                     .font(.system(size: 30))
                     .fontWeight(.semibold)
                     .offset(x: 5)
                Spacer()
                Button {
                    withAnimation {
                        self.showNewEntry = true
                    }
                } label: {
                    Image("circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                }
            }.padding()
            List {
                    ForEach (entry) { EntryItem in
                            Text(EntryItem.title)
                    }
                    .onDelete(perform: deleteEntry)
            }
        }
        Spacer()
        if showNewEntry {
            NewEntryView(EntryItem: EntryItem(title: "", isImportant: false), showNewEntry: $showNewEntry)
        }
    }
    func deleteEntry(at offsets: IndexSet) {
        for offset in offsets {
            let EntryItem = entry[offset]
            modelContext.delete(EntryItem)
        }
    }
}

#Preview {
    Tasks()
}
