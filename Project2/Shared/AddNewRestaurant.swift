//
//  AddNewRestaurant.swift
//  Project #2
//
//  Created by Curren Taber on 10/21/21.
//

import SwiftUI

//  Add Item View
struct AddNewRestaurant: View {
    //  Initializes restaurantStore with an argument from ContentView
    @StateObject var restaurantStore: RestaurantStore
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
            Button(action: addNewRestaurant) {
                Text("Add Restaurant")
            }
        }
    }
    
    //  Function called when "Add Restaurant" Button is pressed
    func addNewRestaurant() {
        let newRestaurant = Restaurant(id: UUID().uuidString, name: name, description: description, isAllergyFriendly: isAllergyFriendly, imageName: "No_Image")
        
        restaurantStore.restaurants.append(newRestaurant)
    }
}

//  Preview Structure
struct AddNewRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRestaurant(restaurantStore: RestaurantStore(restaurants: restaurantData))
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
