//
//  ContentView.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Main List View
struct ContentView: View {
    
    //  Initializes journalStore to restaurantData
    @StateObject private var journalStore: JournalStore = JournalStore(entries: journalData)
    
    
    //A new sheet must be opened when "Add Dream" button is pressed
    @State private var isPresented: Bool = false
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var dreamListVM: DreamListViewModel
    
    //itializing DreamListViewModel to actually see it in Content View
    init(vm: DreamListViewModel) {
        self.dreamListVM = vm
        
        //change color avigation title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(.white))]
    }
    
    private func deleteDream(at offsets: IndexSet) {
        offsets.forEach {
            index in
            let dream = dreamListVM.dreams[index]
            dreamListVM.deleteDream(dreamId: dream.id)
        }
    }
    
//    private func getDream(at offsets: IndexSet) {
//        offsets.forEach {
//            index in
//            let dream = dreamListVM.dreams[index]
//            dreamListVM.getDream(dreamId: dream.id)
//        }
//    }
//
    
    
    
    
    
    
    
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
//                    Text("Dream Journal")
//                        .font(Font.h1)
//                        .foregroundColor(.blue_light)
//                        .padding(.leading, 20)
                    
                    // List of Journal Entries
                    List {
                        
                        ForEach(dreamListVM.dreams) {
                            dream in
            
                            //navigate to EntryDetail screen and pass the view context, current dream title and entry. The current dream title and entry will be displayed in EntryDetail
                            NavigationLink(destination: EntryDetail(vm: DreamListViewModel(context: viewContext))){
                            Text(dream.title).foregroundColor(.white)
                                .font(.title)
                            }

                        }.onDelete(perform: deleteDream)
                        .listRowBackground(Color.purple_dark)
                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(Color.blue_light)
                        .listItemTint(.red)
                    }
                    .listStyle(.plain)
                }
                
                //change this to navigate to new page rather than pop up sheet
                .sheet(isPresented: $isPresented,onDismiss: {
                    //dismiss
                }, content: {
                    AddNewEntry(vm: AddDreamViewModel(context: viewContext))
                } )
                .navigationTitle("Dreams")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add Dream") {
                            isPresented = true
                        }
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
        
        let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
        ContentView(vm: DreamListViewModel(context: viewContext))
        
        
//        Group {
//            ContentView()
//        }
        
        
    }
}

//  Subview used within ContentView
//  Makes the code more organized
struct ListCell: View {
    var entry: Entry
    var body: some View {
        // A ZStack with a custom view on top of an empty NavigationLink
        ZStack {
            // Add an empty view to allow for a custom list row arrow
////            NavigationLink(destination: EntryDetail(selectedEntry: entry)) {
////                EmptyView()
//            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(entry.name)
                            .font(Font.bod)
                        Text(entry.name)
                            .font(Font.h2)
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
