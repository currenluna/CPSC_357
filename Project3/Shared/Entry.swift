//
//  Entry.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import Foundation

//  Restaurant Structure
//  Used to store data from restaurantData.json
struct Entry: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isAllergyFriendly: Bool
    var imageName: String
}
