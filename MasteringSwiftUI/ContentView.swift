//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .red, .white, .orange, .black], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
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
    }
}

#Preview {
    ContentView()
}
