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
        NavigationStack {
            ZStack {
                LinearGradient(colors: screenTapped ? colorList1 : colorList2, startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("MasteringSwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.red)
                    Spacer()
                    Text("MasteringSwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.green)
                    Spacer()
                    Text("MasteringSwiftUI")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.blue)
                    Spacer()
                }
                .rotation3DEffect(
                    .degrees(screenTapped ? 0 : rotationAngle),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FontAnimation(), label: {
                        Image(systemName: "gym.bag")
                    })
                }
                ToolbarItem(placement: .principal) {
                    NavigationLink(destination: MasteringNavigation(), label: {
                        Image(systemName: "arrow.clockwise.circle")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: MasteringGrids(), label : {
                        Image(systemName: "dot.scope.display")
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                withAnimation {
                    screenTapped.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
