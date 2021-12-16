//
//  CanvasView.swift
//  Curren_Taber_and_Aviv_Zohman_Project3 (iOS)
//
//  Created by Curren Taber on 12/11/21.
//

import SwiftUI
import PencilKit

// A canvas for PencilKit
struct CanvasView: View {
  @Binding var canvasView: PKCanvasView
  let onSaved: () -> Void
}

extension CanvasView: UIViewRepresentable {
  // Creates the canvas view
  func makeUIView(context: Context) -> PKCanvasView {
    canvasView.tool = PKInkingTool(.pen, color: .purple, width: 10)
    canvasView.drawingPolicy = .anyInput
    canvasView.delegate = context.coordinator
    return canvasView
  }
  
  // Updates the canvas view
  func updateUIView(_ uiView: PKCanvasView, context: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(canvasView: $canvasView, onSaved: onSaved)
  }
}

class Coordinator: NSObject {
  var canvasView: Binding<PKCanvasView>
  let onSaved: () -> Void
  
  init(canvasView: Binding<PKCanvasView>, onSaved: @escaping () -> Void) {
    self.canvasView = canvasView
    self.onSaved = onSaved
  }
}

extension Coordinator: PKCanvasViewDelegate {
  func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
    if !canvasView.drawing.bounds.isEmpty {
      onSaved()
    }
  }
}
