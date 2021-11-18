//
//  ContentView.swift
//  Shared
//
//  Created by Curren Taber on 11/9/21.
//

import SwiftUI

//  Demo created for iPhone 12 Pro Max
//  ContentView contains a Tab View with 3 tabs (one for each shape):
//      Tab 1 = Badge from Apple Tutorial
//      Tab 2 = A custom shape using Path()
//      Tab 3 = A built-in shape
//  Each shape animates after the user opens its tab

struct ContentView: View {
    let colors = Gradient(colors: [Color.red, Color.yellow, Color.blue, Color.purple])
    @State private var selection = 1
    @State private var rotation3D = 0.0
    @State private var scale: CGFloat = 1
    @State private var rotation = 0.0
    
    var body: some View {
        TabView(selection: $selection) {
            // Tab 1 - From Apple Tutorial
            Badge()
                .rotation3DEffect(Angle.degrees(self.rotation3D), axis: (x: 0, y: 1, z: 0))
                .animation(Animation.linear(duration: 3))
                .onAppear() {
                    self.rotation3D += 180
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Shape One")
                }.tag(1)
            
            
            // Tab 2 - Custom Shape Structure
            MyShape1()
                .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .offset(x: 80, y: 200)
                .scaleEffect(self.scale)
                .animation(Animation.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1))
                .onAppear() {
                    self.scale = self.scale < 1.5 ? 1.5 : 1
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Shape Two")
                }.tag(2)
            
            
            // Tab 3 - Built-in Shape
            Ellipse()
                .stroke(style: StrokeStyle(lineWidth: 50, dash: [CGFloat(20), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                .foregroundColor(.green)
                .frame(width: 200, height: 300)
                .rotationEffect(Angle.degrees(self.rotation))
                .animation(Animation.easeIn(duration: 1))
                .onAppear() {
                    self.rotation += 180
                }
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Shape Three")
                }.tag(3)
        }
        .font(.largeTitle)
    }
}

//  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//  Custom Shape
struct MyShape1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 100, y: 50))
        path.addLine(to: CGPoint(x: 50, y: 100))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.addLine(to: CGPoint(x: 100, y: 220))
        path.addLine(to: CGPoint(x: 170, y: 220))
        path.addLine(to: CGPoint(x: 220, y: 170))
        path.addLine(to: CGPoint(x: 220, y: 100))
        path.addLine(to: CGPoint(x: 170, y: 50))
        path.closeSubpath()
        return path
    }
}
