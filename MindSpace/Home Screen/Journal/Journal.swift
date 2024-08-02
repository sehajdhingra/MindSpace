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
        ZStack {
            Image("background 2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text("Add an entry")
                        .font(.custom("Klasik Regular", size: 30))
                        .foregroundColor(Color(hex: "573353"))
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: true, vertical: false)
                        .offset(x: 10)

                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            self.showNewEntry = true
                        }
                    }) {
                        Image("Plus Button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .offset(y: 10)
                            .offset(x: 20)
                    }
                }
                .padding()
                .offset(y: 20)

                List {
                    ForEach(entry) { EntryItem in
                        Text(EntryItem.title)
                    }
                    .onDelete(perform: deleteEntry)
                }
                .background(Color.clear)
            }
            .padding()
            
            Spacer()
            
            if showNewEntry {
                NewEntryView(EntryItem: EntryItem(title: "", isImportant: false), showNewEntry: $showNewEntry)
            }
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
    Journal()
}
