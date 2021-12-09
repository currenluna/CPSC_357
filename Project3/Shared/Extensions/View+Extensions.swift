//
//  View+Extensions.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import SwiftUI
 //adds basic functionality to views, like centering, for example.

extension View {
    func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self //inbetween Spacers so it centers itself
            Spacer()
        }
    }
}
