//
//  ContentView.swift
//  noteApp
//
//  Created by  illia on 12/11/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State private var showAddNotes = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes) { note in
                        NavigationLink {
                            DetailView(note: note)
                        } label: {
                            VStack {
                                Text(note.title ?? "Unknown")
                                    .font(.title)
                            }
                        }
                    }.onDelete(perform: deleteNotes)
                }
            }.navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddNotes.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showAddNotes) {
                    AddNewNote()
                }
        }
    }
    
    func deleteNotes(at offsets: IndexSet) {
        for offset in offsets {
            let note = notes[offset]
            moc.delete(note)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
