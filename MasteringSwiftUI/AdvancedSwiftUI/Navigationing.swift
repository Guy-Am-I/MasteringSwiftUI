//
//  Navigationing.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct Navigationing: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "dog.fill")
                    .imageScale(.large)
                    .foregroundStyle(Color.accentColor)
                NavigationLink(destination: {
                    ZStack {
                        Color
                            .black
                            .opacity(0.8)
                            .ignoresSafeArea()
                        
                        Image(systemName: "person")
                            .font(.largeTitle)
                            .foregroundStyle(Color.white)
                    }
                }, label: {
                    Text("Click Me!")
                })
            }
        }
    }
}

#Preview {
    Navigationing()
}
