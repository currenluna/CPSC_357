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
    let selectedEntry: Entry
    //  Color options for text views and icon
    let colors: [Color] = [.black, .gray, .red, .orange, .yellow, .green, .blue, .purple, .pink]
    //  Color variables for text views and icon
    @State private var color1: Color = .black
    @State private var color2: Color = .black
    @State private var color3: Color = .black
    @State private var color4: Color = .black
    
    //  Body
    var body: some View {
        Form {
            Section(header: Text("Restaurant Details")) {
                Image(selectedEntry.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedEntry.name)
                    .font(.headline)
                    .foregroundColor(color1)
                
                Text(selectedEntry.description)
                    .font(.body)
                    .foregroundColor(color2)

                HStack {
                    Text("Allergy Friendly?")
                        .font(.headline)
                        .foregroundColor(color3)
                    Spacer()
                    Image(systemName: selectedEntry.isAllergyFriendly ? "checkmark.circle" : "xmark.circle")
                        .foregroundColor(color4)
                }

            }
            
            //  Calls colorize function
            Button(action: colorizeView) {
                Text("🎨 Click to Colorize")
            }
        }
    }
    
    //  Selects a random color from colors list and assigns it to each color variable
    func colorizeView() {
        color1 = colors.randomElement()!
        color2 = colors.randomElement()!
        color3 = colors.randomElement()!
        color4 = colors.randomElement()!
    }
}

//  Preview Structure
struct EntryDetail_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetail(selectedEntry: journalData[0])
    }
}
