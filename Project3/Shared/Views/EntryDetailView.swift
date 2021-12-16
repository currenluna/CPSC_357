//
//  EntryDetailView.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI
import CoreData
import PencilKit

//  Detail View
struct EntryDetailView: View {
    
    // Needed for custom back navigation button
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    //  Initializes to the value passed in from ContentView
    let dream: Dream
    private let dateFormatter = DateFormatter()
    @State private var dateDefault = Date()
    @State private var dreamCanvas = PKCanvasView()
    
    private func onSaved() {} // No purpose, but needed for CanvasView() declaration
    
    //  Body
    var body: some View {
        ZStack(alignment: .top) {
            // Background Color
            Color.purple_light.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(dateFormatter.string(from: dream.date ?? dateDefault))
                    .font(.h2)
                    .foregroundColor(.purple_dark)
                    .padding(.leading, 30)
                CanvasView(canvasView: $dreamCanvas, onSaved: onSaved)
                    .frame(height: 300)
                    .cornerRadius(20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .background(Color.purple_light)
                Text(dream.title ?? "")
                    .font(.h1)
                    .foregroundColor(.purple_dark)
                    .padding(.leading, 30)
                Text(dream.entry ?? "")
                    .font(.bod)
                    .foregroundColor(.purple_dark)
                    .padding(30)
                Spacer()
            }
        }
        .onAppear(perform: {
            do {
                // Get the drawing from Core Data, if it exists
                // Otherwise, the default value is a blank canvas
                try dreamCanvas.drawing = PKDrawing(data: dream.canvas ?? dreamCanvas.drawing.dataRepresentation())
            } catch {
                print(error)
            }
            // Prevents users from editing the dreamCanvas
            dreamCanvas.isUserInteractionEnabled = false
            // Sets the date formatter to the correct format
            dateFormatter.dateFormat = "MM/dd/yyyy"
            // Sets the default date in case we can't access the Core Data date
            dateDefault = dateFormatter.date(from: "00/00/0000") ?? Date()
        })
        // Custom back button code
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
        })
    }
}

//  Preview Structure
struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dream1 = Dream()
        return EntryDetailView(dream: dream1)
    }
}
