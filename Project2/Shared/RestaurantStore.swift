//
//  RestaurantStore.swift
//  Project #2
//
//  Created by Curren Taber on 10/21/21.
//

import SwiftUI
import Combine

//  Restaurant Store Class
//  Has a published list of Restaurants (automatically announces changes)
class RestaurantStore: ObservableObject {
    @Published var restaurants: [Restaurant]
    
    //  Initializer
    init(restaurants: [Restaurant] = []) {
        self.restaurants = restaurants
    }
}
