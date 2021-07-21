//
//  ConfettiView.swift
//  ConfettiView
//
//  Created by Ben Myers on 1/16/21.
//

#if os(iOS)
import SwiftUI

@available(iOS 13.0, *)
fileprivate struct SingleConfettiView: View {
  
  @State var animate = false
  @State var xSpeed = Double.random(in: 0.7...2)
  @State var zSpeed = Double.random(in: 1...2)
  @State var anchor = CGFloat.random(in: -10 ... -5).rounded()
  @State var alive = true
  @State var delay = Double.random(in: 0.0 ... 0.2)
  @State var lifetime = Double.random(in: 8...10)
  @State var offset = CGPoint(x: 0, y: 100)
  @State var size: CGSize = CGSize(width: CGFloat.random(in: 5.0 ... 10.0), height: CGFloat.random(in: 5.0 ... 10.0))
  @State var isCircle: Bool = Bool.random()
  @State var moveAnimation: Animation?
  @State var swing: Double = Double.random(in: -35.0 ... 35.0)
  @State var color: Color = .random
  
  fileprivate var body: some View {
    Rectangle()
      .foregroundColor(color)
      .frame(width: isCircle ? 7.5 : size.width, height: isCircle ? 7.5 : size.height, alignment: .center)
      .cornerRadius(isCircle ? 7.5 : 0.0)
      .onAppear(perform: { animate = true })
      .rotation3DEffect(.degrees(animate ? 360:0), axis: (x: 1, y: 0, z: 0))
      .animation(Animation.linear(duration: alive ? xSpeed : 0.0).repeatForever(autoreverses: false), value: animate)
      .rotation3DEffect(.degrees(animate ? -swing : swing), axis: (x: 0, y: 0, z: 1), anchor: UnitPoint(x: 0, y: anchor))
      .animation(Animation.easeInOut(duration: zSpeed).repeatForever(autoreverses: true), value: animate)
      .opacity(alive ? 1.0 : 0.0)
      .scaleEffect(alive ? 1.0 : 0.0)
      .animation(Animation.linear(duration: lifetime), value: alive)
      .animation(moveAnimation, value: offset)
      .onAppear {
        moveAnimation = Animation.easeOut(duration: 0.5).delay(delay)
        animate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 + delay) {
          self.alive = false
        }
        offset = CGPoint(x: CGFloat.random(in: -200.0 ... 200.0), y: CGFloat.random(in: -50.0 ... 30.0))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + delay) {
          self.moveAnimation = .easeIn(duration: lifetime - 0.5)
          self.offset.y += 300.0
        }
      }
      .onDisappear {
        animate = false
        xSpeed = Double.random(in: 0.7...2)
        zSpeed = Double.random(in: 1...2)
        anchor = CGFloat.random(in: -10 ... -5).rounded()
        alive = true
        lifetime = Double.random(in: 8...10)
        offset = CGPoint(x: 0, y: 100)
        moveAnimation = Animation.easeOut(duration: 0.5).delay(Double.random(in: 0.0...0.4))
        size = CGSize(width: CGFloat.random(in: 5.0 ... 10.0), height: CGFloat.random(in: 5.0 ... 10.0))
        isCircle = Bool.random()
      }
      .offset(x: offset.x, y: offset.y)
  }
}

public struct ConfettiView: View {
  
  /// The color of the confetti. Leave blank to imply random colors.
  fileprivate var color: Color? = nil
  
  public init() {}
  
  public init(_ color: Color) {
    self.color = color
  }
  
  public var body: some View {
    
    ZStack {
      
      ForEach(0...20, id: \.self) { _ in
        if let color = self.color {
          SingleConfettiView(color: color)
        } else {
          SingleConfettiView()
        }
      }
    }
  }
}

#endif
