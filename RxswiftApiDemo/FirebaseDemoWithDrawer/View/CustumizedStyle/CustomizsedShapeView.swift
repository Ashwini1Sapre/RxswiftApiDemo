//
//  CustomizsedShapeView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 05/05/21.
//

import Foundation
import SwiftUI

struct StarViewModel: Shape {
    let corner: Int
    let smothness: CGFloat
    
    
    func path(in rect: CGRect) -> Path {
        
        guard corner >= 2  else {
            return Path()
        }
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
         
        var currentAngel = -CGFloat.pi / 2
        let angelAdjust = .pi * 2 / CGFloat(corner * 2)
        let innerX = center.x * smothness
        let innerY = center.y * smothness
        var path = Path()
        
        path.move(to: CGPoint(x: center.x * cos(currentAngel), y: center.y * sin(currentAngel)))
        
        var bottomEdge: CGFloat = 0
        
        for corner in 0..<corner * 2  {
            
            
            let sinAngle = sin(currentAngel)
            let cosAngle = cos(currentAngel)
            
            var bottom: CGFloat
            
            if corner.isMultiple(of: 2) {
                
                bottom = center.y * sinAngle
                
              //  path.addLines(to: CGPoint(x: center.x * cosAngle, y: bottom))
                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
                
                
                
            }
            else {
                
                bottom = innerY * sinAngle
                
                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
                
            }
            
            if bottom > bottomEdge {
                
                bottomEdge = bottom
                
            }
            currentAngel += angelAdjust
            
        }
        
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2
        
        let transfrom = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transfrom)
        
    }
    
    
    
    
    
    
    
}


struct CustomizsedShapeView: View {
    var body: some View {
        StarViewModel(corner: 5, smothness: 0.45)
                   .fill(Color.red)
                   .frame(width: 200, height: 200)
                   .background(Color.green)


    }
}


struct  CustomizsedShapeView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomizsedShapeView()
        
    }
    
    
}

