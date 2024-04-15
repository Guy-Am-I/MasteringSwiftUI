//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    GradientAnimation()
                        .tabItem {
                            Label("Gradient", systemImage: "pencil.tip.crop.circle.fill")
                        }
                    ListExercise(a: 5, d: 5, n: 100)
                        .tabItem {
                            Label("Lists", systemImage: "list.clipboard")
                        }
                }
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
        }
    }
}

#Preview {
    ContentView()
}
