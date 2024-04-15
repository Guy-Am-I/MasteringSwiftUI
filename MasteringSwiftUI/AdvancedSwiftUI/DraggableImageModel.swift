//
//  DraggableImageModel.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-15.
//

import Foundation
import SwiftUI

struct DraggableImage: Identifiable {
    let id = UUID()
    let name: String
    var color: Color = [.red, .blue, .pink, .indigo, .yellow, .white, .cyan].randomElement() ?? .white
    var zIndex: Double = 0
    
    
    
}
