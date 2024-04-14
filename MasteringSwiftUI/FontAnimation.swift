//
//  FontAnimation.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct FontAnimation: View {
    @State var toggleFont = false
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.3).ignoresSafeArea()
            
            VStack {
                Text("Hey there!")
                    .font(toggleFont ? .largeTitle : .caption)
                    .fontWeight(.bold)
                
                Button(action: {
                    toggleFont.toggle()
                }, label: {
                    Text("Click me!")
                        .font(.title)
                        .fontWeight(.semibold)
                })
            }.padding()
        }
    }
}

#Preview {
    FontAnimation()
}
