//
//  Dream+Extensions.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import CoreData

extension Dream: BaseModel {
    
    static var all: NSFetchRequest<Dream> {
        let request = Dream.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
