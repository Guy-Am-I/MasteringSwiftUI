//
//  TrimCapsulke.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI


struct TrimCapsule: View {
    let width: CGFloat
    let height: CGFloat
    let leftColor: Color
    let rightColor: Color
    let lineWidth: CGFloat
    let strokeColor: Color
    let bgLeftColor: Color
    let bgRightColor: Color
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(leftColor)
                .padding()
                .background(bgLeftColor)
            Rectangle()
                .fill(rightColor)
                .padding()
                .background(bgRightColor)
        }
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .trim(from: 0, to: 0.25)
                .stroke(strokeColor, lineWidth: lineWidth)
        )
        .overlay(
            Capsule()
                .trim(from: 0.75, to: 1)
                .stroke(strokeColor, lineWidth: lineWidth)
        )
        .frame(width: width, height: height)
    }
}

struct ShowcaseCapsules: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
        VStack {
            TrimCapsule(width: 250, height: 50, leftColor: .yellow, rightColor: .orange, lineWidth: 1, strokeColor: .black, bgLeftColor: .purple, bgRightColor: .green)
            
            TrimCapsule(width: 250, height: 50, leftColor: .blue, rightColor: .red, lineWidth: 5, strokeColor: .white, bgLeftColor: .cyan, bgRightColor: .indigo)
            }
        }
    }
}

#Preview {
    ShowcaseCapsules()
}
