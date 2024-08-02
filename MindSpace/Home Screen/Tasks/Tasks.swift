//
//  Tasks.swift
//  FinalProject
//
//  Created by Nadia Begum on 30/07/2024.
//

import SwiftUI
import SwiftData

struct Tasks: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Image("background 2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("To Do List")
                        .font(.custom("Klasik Regular", size: 30))
                        .foregroundColor(Color(hex: "573353"))
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: true, vertical: false)
                        .offset(x: 10)
                    Spacer()
                    Button {
                        withAnimation {
                            self.showNewTask = true
                        }
                    } label: {
                        Image("Plus Button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .offset(y: 10)
                            .offset(x: 20)
                        
                    }
                }
                .padding()
                .offset(y: 35)
                
                
                List {
                    ForEach (toDos) { toDoItem in
                        Text(toDoItem.title)
                    }
                    .onDelete(perform: deleteToDo)
                }
            }
            Spacer()
            if showNewTask {
                NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
            }
        }
    }
    
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    Tasks()
}
