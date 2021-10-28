//
//  ContentView.swift
//  Project #2
//
//  Created by Curren Taber on 10/21/21.
//

import SwiftUI

//  Main List View
struct ContentView: View {
    //  Initializes restaurantStore to restaurantData
    @StateObject private var restaurantStore: RestaurantStore = RestaurantStore(restaurants: restaurantData)
    
    //  Body
    //  Its NavigationView contains NavigationLink (see ListCell)
    var body: some View {
        NavigationView {
            List {
                //  Creates a row for each Restaurant in restaurantStore
                ForEach(restaurantStore.restaurants) { restaurant in
                    ListCell(restaurant: restaurant)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("LA Restaurants"))
            //  Buttons for adding new list items and editing the list
            .navigationBarItems(leading: NavigationLink(destination: AddNewRestaurant(restaurantStore: self.restaurantStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    //  Enables user to delete list items
    func deleteItems(at offsets: IndexSet) {
        restaurantStore.restaurants.remove(atOffsets: offsets)
    }
    
    //  Enables user to move list items
    func moveItems(from source: IndexSet, to destination: Int) {
        restaurantStore.restaurants.move(fromOffsets: source, toOffset: destination)
    }
}

//  Preview Structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//  Subview used within ContentView
//  Makes the code more organized
struct ListCell: View {
    var restaurant: Restaurant
    var body: some View {
        NavigationLink(destination: RestaurantDetail(selectedRestaurant: restaurant)) {
            HStack {
                Image(restaurant.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white))
                    .shadow(radius: 3)
                    .padding(10)
                Text(restaurant.name)
                    .font(.headline)
            }
        }
    }
}
