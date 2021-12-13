//
//  EntryDetail.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Detail View
struct EntryDetail: View {
    
    //  Initializes to the value passed in from ContentView
    let dream: Dream
    @State private var dreamName: String = ""
    @State private var dreamEntry: String = ""
    let coreDM: CoreDataManager
//    @Binding var needsRefresh: Bool
    
    //  Body
    var body: some View {
        Form {
            Section(header: Text(dream.title ?? "")) {
                Image("Landscape")
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()

                
                Text(dream.entry ?? "")
                    .font(.body)
                    .padding()

            }.font(.title2)
        }
    }
}

//  Preview Structure
struct EntryDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dream = Dream()
        EntryDetail(dream: dream, coreDM: CoreDataManager())
    }
}
