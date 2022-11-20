//
//  AddNewNote.swift
//  noteApp
//
//  Created by  illia on 12/11/2022.
//

import SwiftUI

struct AddNewNote: View {
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) var moc
    
    @State var text: String = ""
    @State var savedtext: String = ""
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                
                TextEditor(text: $text)
                    .frame(height: 150)
                    .foregroundColor(.blue)
                    .bold()
                    .cornerRadius(12)
                Button(action: {
                    savedtext = text
                    let newNote = Note(context: moc)
                    newNote.id = UUID()
                    newNote.title = title
                    newNote.text = text
                    
                    try? moc.save()
                    dismiss()
                }) {
                    Text("Save"
                        .uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                Text(savedtext)
                
                Spacer()
            }.padding()
                .background(Color.green)
        }
    }
}

struct AddNewNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNote()
    }
}
