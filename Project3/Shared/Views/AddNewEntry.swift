//
//  AddNewEntry.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI
import PencilKit
import Foundation

//  Add Item View
struct AddNewEntry: View {
    
    // Canvas View
    @State private var canvasView = PKCanvasView()
    
    // Core Data Variables for Dreams
//private let dreamID: UUID = UUID()
    @State private var dreamTitle: String = ""
    @State private var dreamEntry: String = ""
    @State private var dreamCanvas: Data = Data()
    private let dreamDate: Date = Date()
    
    // Core Data Manager
    let coreDM: CoreDataManager
    
//    @Binding var needsRefresh: Bool
    
    @State private var dreams: [Dream] = [Dream]()
    private func populateDreams() {
        dreams = coreDM.getAllDreams()
    }
    
    
    //  Body
    var body: some View {
        Form {
            Section(header: Text("New Dream")) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                TextField("Title", text: $dreamTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Entry", text: $dreamEntry)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    if !dreamTitle.isEmpty {
                        coreDM.saveDream(title: dreamTitle, entry: dreamEntry, canvas: dreamCanvas, date: dreamDate)
                        populateDreams()
    //                    needsRefresh.toggle()
                    }
                }
            }
        }
    }
}

//  Preview Structure
struct AddNewEntry_Previews: PreviewProvider {
    static var previews: some View {
        
        AddNewEntry(coreDM: CoreDataManager())
    }
}

//  Subview for general text input
//struct DataInput: View {
//    var title: String
//    @Binding var userInput: String
//    var body: some View {
//        VStack(alignment: HorizontalAlignment.leading) {
//            Text(title)
//                .font(.headline)
//            TextField("Enter \(title)", text: $userInput)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//        }
//        .padding()
//    }
//}
