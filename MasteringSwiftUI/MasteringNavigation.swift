//
//  MasteringNavigation.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct MasteringNavigation: View {
    @State var name = ""
    @State var age = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.8).ignoresSafeArea()
                
                VStack() {
                    Text("Enter your info")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Enter your name")
                        TextField("Guy", text: $name)
                        Text("Enter your age")
                        TextField("26", text: $age)
                    }.padding()
                    NavigationLink(destination: ProcessView(name: name, age: age), label: {
                        Text("Submit")
                            .font(.title2)
                            .padding()
                            .overlay(Capsule().stroke())
                            .foregroundStyle(.white)
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ProcessView: View {
    let name: String
    let age: String
    
    var numericalAge: Int {
        Int(age) ?? 0
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            
            if numericalAge == 0 {
                Text("Invalid Input")
            } else {
                Text("Hi there \(name) of age: \(age)")
            }
        }
    }
}

#Preview {
    MasteringNavigation()
}
