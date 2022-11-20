//
//  DetailView.swift
//  noteApp
//
//  Created by  illia on 12/11/2022.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var text = ""
    let note: Note
    var body: some View {
       // NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.yellow]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text(note.title ?? "Unknown")
                    ScrollView(showsIndicators: false) {
                        Text(note.text ?? "Unknown")
                    }.padding()
                        .frame(width: UIScreen.main.bounds.width * 0.95)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
       // }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        static var previews: some View {
            let note = Note(context: moc)
            note.title = "Title 1"
            note.text = "Text 1"

            return NavigationView {
                DetailView(note: note)
            }
        }
}
