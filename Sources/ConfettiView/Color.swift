//
//  File.swift
//  
//
//  Created by Ben Myers on 6/15/21.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
internal extension Color {
  
  static var random: Color {
    switch(Int.random(in: 0...5)) {
    case 0: return Color.red
    case 1: return Color.orange
    case 2: return Color.yellow
    case 3: return Color.green
    case 4: return Color.blue
    case 5: return Color.purple
    default: return .black
    }
  }
}
