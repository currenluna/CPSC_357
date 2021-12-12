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
//    let selectedEntry: Entry
    //  Color options for text views and icon
    let colors: [Color] = [.black, .gray, .red, .orange, .yellow, .green, .blue, .purple, .pink]
    //  Color variables for text views and icon
    @State private var color1: Color = .black
    @State private var color2: Color = .black
    @State private var color3: Color = .black
    @State private var color4: Color = .black
    
    
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
                
//                Text(dream.title ?? "")
//                    .font(.headline)
//                    .foregroundColor(color1)
                
                Text(dream.entry ?? "")
                    .font(.body)
                    .foregroundColor(color2)
                    .padding()

//                HStack {
//                    Text("Allergy Friendly?")
//                        .font(.headline)
//                        .foregroundColor(color3)
//                    Spacer()
//                    Image(systemName: selectedEntry.isAllergyFriendly ? "checkmark.circle" : "xmark.circle")
//                        .foregroundColor(color4)
//                }

            }.font(.title2)
            
            //  Calls colorize function
//            Button(action: colorizeView) {
//                Text("🎨 Click to Colorize")
//            }
        }
    }
    
    //  Selects a random color from colors list and assigns it to each color variable
//    func colorizeView() {
//        color1 = colors.randomElement()!
//        color2 = colors.randomElement()!
//        color3 = colors.randomElement()!
//        color4 = colors.randomElement()!
//    }
}

//  Preview Structure
struct EntryDetail_Previews: PreviewProvider {
    static var previews: some View {
        let dream = Dream()
//        let coreDM = CoreDataManager()
        
        EntryDetail(dream: dream, coreDM: CoreDataManager())
    }
}
