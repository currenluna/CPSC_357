//
//  DrawingView.swift
//  Curren_Taber_and_Aviv_Zohman_Project3 (iOS)
//
//  Created by Curren Taber on 12/11/21.
//

import SwiftUI
import PencilKit

struct DrawingView: View {

  // MARK: - State variables
  @State var rendition: Rendition?
  @State private var isSharing = false
  @State private var isSelectingMasterpiece = false
  @State private var isShowingPreview = false
  @State private var isShowingPreviewMessage = false
  @State private var selectedMasterpiece = -1
  @State private var canvasView = PKCanvasView()

  var body: some View {
    NavigationView {
      ZStack {
        CanvasView(canvasView: $canvasView, onSaved: saveDrawing)
          .padding(20.0)
        .background(Color.gray)
        .navigationBarTitle(Text("Masterpiece"), displayMode: .inline)
        .navigationBarItems(
          leading: HStack {},
          trailing: HStack {
            Button(action: deleteDrawing) {
              Image(systemName: "trash")
            }
          })
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - Private Methods
private extension DrawingView {
  func saveDrawing() {
    // 1
    let image = canvasView.drawing.image(from: canvasView.bounds, scale: UIScreen.main.scale)
    // 2
    let rendition = Rendition(title: "Best Drawing", drawing: canvasView.drawing, image: image)
    // 3
    self.rendition = rendition
  }

  func deleteDrawing() {
    canvasView.drawing = PKDrawing()
  }

  func shareDrawing() {
    if rendition != nil {
      isSharing = true
    }
  }
}

struct DrawingView_Previews: PreviewProvider {
  static var previews: some View {
    DrawingView()
  }
}
