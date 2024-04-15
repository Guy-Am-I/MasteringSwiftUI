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
                    NavDestView()
                }, label: {
                    Text("Click Me!")
                })
            }
            .navigationTitle("Iraishaimase!")
            .navigationBarBackButtonHidden()
        }
    }
}

struct NavDestView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .yellow, .black, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                NavigationLink(destination: Navigationing(), label: {
                    Text("Go Back")
                        .padding()
                        .overlay {
                            Capsule().stroke()
                        }
                        .foregroundStyle(Color.white)
                })
                ScrollView {
                    Text("Text")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                    MisleadingView()
                }
            }.padding(.horizontal)
        }.navigationBarBackButtonHidden()
    }
}

struct MisleadingView: View {
    var body: some View {
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            .font(.headline)
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    Navigationing()
}
