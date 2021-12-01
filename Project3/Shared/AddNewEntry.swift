//
//  AddNewEntry.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Add Item View
struct AddNewEntry: View {
    //  Initializes journalStore with an argument from ContentView
    @StateObject var journalStore: JournalStore
    //  Uses State variables to store user input
    @State private var isAllergyFriendly = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    //  Body
    var body: some View {
        Form {
            Section(header: Text("Restaurant Details")) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isAllergyFriendly) {
                    Text("Allergy Friendly?").font(.headline)
                }.padding()
            }
            
            //  Calls addNewRestaurant function
            Button(action: addNewEntry) {
                Text("Add Restaurant")
            }
        }
    }
    
    //  Function called when "Add Restaurant" Button is pressed
    func addNewEntry() {
        let newEntry = Entry(id: UUID().uuidString, name: name, description: description, isAllergyFriendly: isAllergyFriendly, imageName: "No_Image")
        
        journalStore.entries.append(newEntry)
    }
}

//  Preview Structure
struct AddNewEntry_Previews: PreviewProvider {
    static var previews: some View {
        AddNewEntry(journalStore: JournalStore(entries: journalData))
    }
}

//  Subview for general text input
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
