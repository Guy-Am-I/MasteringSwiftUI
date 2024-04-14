//
//  MasteringGrids.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-14.
//

import SwiftUI

struct MasteringGrids: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.2).ignoresSafeArea()
            
            Grid {
                GridRow {
                    Rectangle()
                        .fill(.yellow)
                        .clipShape(.rect)
                    Rectangle()
                        .fill(.yellow)
                        .clipShape(.rect)
                    Rectangle()
                        .fill(.yellow)
                        .clipShape(.rect)
                }
                GridRow {
                    Rectangle()
                        .fill(.red)
                        .clipShape(.rect)
                    Rectangle()
                        .fill(.orange)
                        .clipShape(.rect)
                        .gridCellColumns(2)
                }
            }.padding()
        }
    }
}

#Preview {
    MasteringGrids()
}
