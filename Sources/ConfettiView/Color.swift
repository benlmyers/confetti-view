//
//  File.swift
//  
//
//  Created by Ben Myers on 6/15/21.
//

#if os(iOS)

import SwiftUI
import UIKit

@available(iOS 13.0, *)
internal extension Color {
  
  static var random: Color {
    switch(Int.random(in: 0...5)) {
      case 0: return Color(#colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1))
      case 1: return Color(#colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1))
      case 2: return Color(#colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1))
      case 3: return Color(#colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1))
      case 4: return Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
      case 5: return Color(#colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1))
      default: return .black
    }
  }
}

internal extension UIColor {
  
  static var random: UIColor {
    switch(Int.random(in: 0...5)) {
      case 0: return UIColor(#colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1))
      case 1: return UIColor(#colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1))
      case 2: return UIColor(#colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1))
      case 3: return UIColor(#colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1))
      case 4: return UIColor(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
      case 5: return UIColor(#colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1))
      default: return .black
    }
  }
}

#endif
