//
//  Restaurant.swift
//  Project #2
//
//  Created by Curren Taber on 10/21/21.
//

import Foundation

//  Restaurant Structure
//  Used to store data from restaurantData.json
struct Restaurant: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isAllergyFriendly: Bool
    var imageName: String
}
