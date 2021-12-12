//
//  AddNewEntry.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI
import Foundation

//  Add Item View
struct AddNewEntry: View {
    //  Initializes journalStore with an argument from ContentView
//    @StateObject var journalStore: JournalStore
//    //  Uses State variables to store user input
//    @State private var isAllergyFriendly = false
//    @State private var name: String = ""
//    @State private var description: String = ""
    
    @State private var dreamTitle: String = ""
    @State private var dreamEntry: String = ""
    let coreDM: CoreDataManager
//    @Binding var needsRefresh: Bool
    
    @State private var dreams: [Dream] = [Dream]()
    private func populateDreams() {
        dreams = coreDM.getAllDreams()
    }
    
    
    //  Body
    var body: some View {
        Form {
            Section(header: Text("New Dream")) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                TextField("Title", text: $dreamTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Entry", text: $dreamEntry)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    if !dreamTitle.isEmpty {
                        coreDM.saveDream(title: dreamTitle, entry: dreamEntry)
                        populateDreams()
    //                    needsRefresh.toggle()
                    }
                }
                
                
//                DataInput(title: "Title", userInput: $dreamTitle)
//                DataInput(title: "Entry", userInput: $dreamEntry)
//
//                Button("Save") {
//                    if !dreamTitle.isEmpty {
//                        coreDM.saveDream(title: dreamTitle, entry: dreamEntry)
//                        populateDreams()
//    //                    needsRefresh.toggle()
//                    }
//                }
                
//                Toggle(isOn: $isAllergyFriendly) {
//                    Text("Allergy Friendly?").font(.headline)
//                }.padding()
            }
            
            //  Calls addNewRestaurant function
//            Button("Save") {
//                if !dreamTitle.isEmpty {
//                    coreDM.saveDream(title: dreamTitle, entry: dreamEntry)
//                    populateDreams()
////                    needsRefresh.toggle()
//                }
//            }
        }
    }
    
    //  Function called when "Add Restaurant" Button is pressed
//    func addNewEntry() {
//        let newEntry = Entry(id: UUID().uuidString, name: name, description: description, isAllergyFriendly: isAllergyFriendly, imageName: "No_Image")
//        
//        journalStore.entries.append(newEntry)
//    }
}

//  Preview Structure
struct AddNewEntry_Previews: PreviewProvider {
    static var previews: some View {
        
        AddNewEntry(coreDM: CoreDataManager())
    }
}

//  Subview for general text input
//struct DataInput: View {
//    var title: String
//    @Binding var userInput: String
//    var body: some View {
//        VStack(alignment: HorizontalAlignment.leading) {
//            Text(title)
//                .font(.headline)
//            TextField("Enter \(title)", text: $userInput)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        .padding()
//    }
//}
