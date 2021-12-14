//
//  ContentView.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Main List View
struct ContentView: View {
    
    // Variables for Core Data
    
    // Not best practice to use State variables to populate Core Data
    // State variables should just be used for controlling the UI
    let coreDM: CoreDataManager
    @State private var dreamTitle: String = ""
    @State private var dreamEntry: String = ""
    @State private var isShowingSheet = false

    @State private var dreams: [Dream] = [Dream]()
    private func populateDreams() {
        dreams = coreDM.getAllDreams()
    }
    
    //  Body
    //  Its NavigationView contains NavigationLink (see ListCell)
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                // Background Color
                Color.purple_dark.edgesIgnoringSafeArea(.all)
                
                // VStack with Header and List
                VStack(alignment: .leading) {
                    // Header
                    Text("Dream Journal")
                        .font(Font.h1)
                        .foregroundColor(.blue_light)
                        .padding(.leading, 20)
                    // List of Journal Entries
                    List {
                        //  Creates a row for each Entry in Core Data
                        ForEach(dreams, id: \.self) { dream in
                            ListCell(dream:dream, coreDM: coreDM)
                        }.onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                let dream = dreams[index]
                                // delete it using Core Data Manager
                                coreDM.deleteDream(dream: dream)
                                populateDreams()
                            }
                        })
                        .listRowBackground(Color.purple_dark)
                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(Color.blue_light)
                    }
                    .listStyle(.plain)
                    //  Buttons for adding new list items and editing the list
                    .navigationBarItems(leading: Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }, trailing: EditButton().font(Font.butn))
                }
                
                NavigationLink(destination: AddNewEntry(coreDM: coreDM)) {
                    ZStack {
                        Circle()
                            .frame(width: 111, height: 111)
                            .foregroundColor(Color.blue_dark)
                            .padding()
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                        Rectangle()
                            .frame(width: 5, height: 69)
                            .foregroundColor(.blue_light)
                        Rectangle()
                            .frame(width: 69, height: 5)
                            .foregroundColor(.blue_light)
                    }
                }
            }
            .onAppear(perform: {
                populateDreams()
            })
            .sheet(isPresented: $isShowingSheet) {
                ZStack {
                    // Background Color
                    Color.purple_light.edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            isShowingSheet.toggle()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(20)
                        }
                        HelpView()
                    }
                }
            }
        }
        .accentColor(Color.blue_dark)
    }
}

//  Preview Structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

//  Subview used within ContentView
//  Makes the code more organized
struct ListCell: View {
    var dream: Dream
    let coreDM: CoreDataManager
    

    var body: some View {
        // A ZStack with a custom view on top of an empty NavigationLink
        ZStack {
            // Add an empty view to allow for a custom list row arrow
            NavigationLink(destination: EntryDetail(dream: dream)) {
                EmptyView()
            }

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(dream.title ?? "")
                            .font(Font.h2)
//                        Text(entry.name)
//                            .font(Font.h2)
                    }
                    Spacer()
                    Image(systemName: "chevron.right") // Allows for custom color
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, alignment: .trailing)
                }
                .foregroundColor(.blue_light)
                .padding(.top)
                .padding(.bottom)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.blue_light)

            }
        }
    }
}
