//
//  ListExercise.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct ListExercise: View {
    let a: Int
    let d: Int
    let n: Int
    
    var strider: StrideTo<Int> {
        stride(from: a, to: n+1, by: d)
    }
        
    var numbers: [Int] {
        strider.map({$0})
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self) { num in
                    Text("\(num)")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.cyan)
        }
    }
}

#Preview {
    ListExercise(a: 5, d: 5, n: 100)
}
