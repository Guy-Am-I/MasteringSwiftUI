//
//  MasterGrids.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

struct MasterGrids: View {
    var body: some View {
        ZStack {
            Color
                .cyan
                .opacity(0.5)
                .ignoresSafeArea()
            
            Grid(verticalSpacing: 0) {
                GridRow {
                    Rectangle()
                        .fill(Color.red)
                        .overlay {
                            Text("50%")
                        }
                }
                GridRow {
                    Grid(verticalSpacing: 0) {
                        GridRow {
                            Rectangle()
                                .fill(Color.green)
                                .overlay {
                                    Text("25%")
                                }
                        }
                        GridRow {
                            Rectangle()
                                .fill(Color.blue)
                                .overlay {
                                    Text("25%")
                                }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MasterGrids()
}
