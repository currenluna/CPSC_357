//
//  HelpView.swift
//  Curren_Taber_and_Aviv_Zohman_Project3 (iOS)
//
//  Created by Curren Taber on 12/13/21.
//

import SwiftUI


struct HelpView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Tutorial")
                    .font(.h1)
                    .foregroundColor(.purple_normal)
                    .padding(.leading, 20)
                
                Spacer()
                    .frame(height: 10)
                
                TutorialManagingDreams()
                
                TutorialAddingNewDreams()
                
                Text("An iOS Application by Curren & Aviv")
                    .font(.bod)
                    .foregroundColor(.gray)
                    .padding(20)
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

// First subsection of Tutorial
struct TutorialManagingDreams: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Managing Dreams")
                .font(.h2)
                .foregroundColor(.purple_normal)
                .padding(.leading, 20)
            
            Text("When you first open your dream journal, you’ll see a list of your dreams. Click on any of the rows to view a dream entry...")
                .font(.bod)
                .foregroundColor(.purple_normal)
                .padding(20)

            Image("tutorial_list")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
            
            Text("To add a new dream, press the + button on the bottom-left corner...")
                .font(.bod)
                .foregroundColor(.purple_normal)
                .padding(20)
            
            HStack(alignment: .center) {
                Spacer()
                Image("tutorial_button_add")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 111, height: 111, alignment: .center)
                Spacer()
            }
            
            Text("To delete a dream, press the Edit button and use the red minus buttons. Confirm the deletion by pressing ‘Delete’ with it appears.")
                .font(.bod)
                .foregroundColor(.purple_normal)
                .padding(20)
        }
    }
}

// Second subsection of Tutorial
struct TutorialAddingNewDreams: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Adding New Dreams")
                .font(.h2)
                .foregroundColor(.purple_normal)
                .padding(.leading, 20)
            
            Text("Whenever you add a new dream, the date will automatically be recorded. This means that your dream list will automatically sort dreams according to their entry date. \n\n You can add a Sketch, a Name, and a Description for your dreams. To reset your sketch, simply press the trash button.")
                .font(.bod)
                .foregroundColor(.purple_normal)
                .padding(20)
            
            HStack {
                Spacer()
                Image(systemName: "trash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.purple_normal)
                Spacer()
            }
        }
    }
}
