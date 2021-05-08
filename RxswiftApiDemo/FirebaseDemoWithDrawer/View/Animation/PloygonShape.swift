//
//  PloygonShape.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 08/05/21.
//

import Foundation
import SwiftUI

struct PloygonShape: Shape
{
    var slides: Double
    var scale: Double
    
  var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(slides, scale) }
        set {
            slides = newValue.first
            scale = newValue.second
          }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        let extra: Int = slides != Double(Int(slides)) ? 1 : 0
        var vertex: [CGPoint] = []
        for i in 0..<Int(slides) + extra {
            let angle = (Double(i) * (360.0 / slides) * (Double.pi / 180))
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            vertex.append(pt)
            
            if i == 0 {
                
                path.move(to: pt)
            }
            else
            {
                path.addLine(to: pt)
            }
          
        }
        path.closeSubpath()
        drawVertexLines(path: &path, vertex: vertex, n: 0)
        return path
        
    }
    
    func drawVertexLines(path: inout Path, vertex: [CGPoint], n: Int) {
        
        if(vertex.count - n) < 3 { return }
        
        for i in (n+2)..<min(n + (vertex.count-1), vertex.count) {
            
            path.move(to: vertex[n])
            path.addLine(to: vertex[i])
        }
        drawVertexLines(path: &path, vertex: vertex, n: n+1)
        
    }
   
}
