//
//  SimplePolygonShape.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 08/05/21.
//

import Foundation
import SwiftUI

struct SimplePolygonShape: Shape {
    var sides: Double
    var scale: Double
    
    var animationData: AnimatablePair<Double, Double> {
        
        get { AnimatablePair(sides, scale) }
        set {
            
            sides = newValue.first
            scale = newValue.second
        }
        
        
    }
    
    func path(in rect: CGRect) -> Path {
        
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale
        
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        let extra: Int = sides != Double(Int(sides)) ? 1 : 0
        
        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360 / sides)) * (Double.pi / 180)
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt)
                
                
            }
            else
            {
                path.addLine(to: pt)
            }
            
        }
        
        path.closeSubpath()
        return path
        
        
    }
    
    
    
    
    
    
    
    
    
}
