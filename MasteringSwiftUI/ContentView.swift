//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct ContentView: View {
    
    let colorList1: [Color] = [.yellow, .red, .white, .orange, .black]
    var colorList2: [Color] {
        colorList1.reversed()
    }
    
    @State private var screenTapped = false
    
    let rotationAngle = 360.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: screenTapped ? colorList1 : colorList2, startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack {
                Text("MasteringSwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.red)
                Text("MasteringSwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.green)
                Text("MasteringSwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.blue)
            }
            .rotation3DEffect(
                .degrees(screenTapped ? 0 : rotationAngle),
                                      axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        }
        .onTapGesture {
            withAnimation {
                screenTapped.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
