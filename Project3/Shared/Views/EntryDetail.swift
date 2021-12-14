//
//  EntryDetail.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI
import CoreData
import PencilKit

//  Detail View
struct EntryDetail: View {
    
    //  Initializes to the value passed in from ContentView
    let dream: Dream
    @State private var canvas = PKCanvasView()
    
    private func onSaved() {}
    
    //  Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Date")
                .font(.h2)
                .foregroundColor(.purple_dark)
            CanvasView(canvasView: $canvas, onSaved: onSaved)
            
        }
        .onAppear(perform: {
            do {
                try canvas.drawing = PKDrawing(data: dream.canvas ?? canvas.drawing.dataRepresentation())
            } catch {
                print(error)
            }
            canvas.isUserInteractionEnabled = false
            
        })
        
//        Form {
//            Section(header: Text(dream.title ?? "")) {
//                Image("Landscape")
//                    .resizable()
//                    .cornerRadius(12.0)
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
//
//
////                Text(dream.entry ?? "")
////                    .font(.body)
////                    .padding()
//
//            }.font(.title2)
//        }
    }
}

//  Preview Structure
struct EntryDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        let dream1 = Dream()
        return EntryDetail(dream: dream1)
    }
}
