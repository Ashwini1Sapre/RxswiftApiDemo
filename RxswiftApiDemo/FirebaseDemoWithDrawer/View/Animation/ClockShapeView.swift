//
//  ClockShapeView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 08/05/21.
//

import Foundation
import SwiftUI

struct  ClockShape: Shape {
    var clockTime: ClockTime
    
    var animatableData: ClockTime
    {
        get { clockTime }
        set { clockTime = newValue }
        
    }
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.size.width / 2.0, rect.size.height / 2.0)
        let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        let hHypotenuse = Double(radius) * 0.5
        let mHypotenouse = Double(radius) * 0.7
        let sHypoenouse = Double(radius) * 0.9
        
        let hangle: Angle = .degrees(Double(clockTime.hours) / 12 * 360 - 90)
        let mangle: Angle = .degrees(Double(clockTime.mins) / 60 * 360 - 90)
        let sangle: Angle = .degrees(Double(clockTime.sec) / 60 * 360 - 90)
        
        let hourNeedle = CGPoint(x: center.x + CGFloat(cos(hangle.radians) * hHypotenuse), y: center.y + CGFloat(sin(hangle.radians) * hHypotenuse))
        let minuteNeedle = CGPoint(x: center.x + CGFloat(cos(mangle.radians) * mHypotenouse), y: center.y + CGFloat(sin(mangle.radians) * mHypotenouse))
        let secNeedle = CGPoint(x: center.x + CGFloat(cos(sangle.radians) * sHypoenouse), y: center.x + CGFloat(sin(sangle.radians) * sHypoenouse))
        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        
        path.move(to: center)
        path.addLine(to: hourNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))
        
        
        path.move(to: center)
        path.addLine(to: minuteNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))
        
        path.move(to: center)
        path.addLine(to: secNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 1.0))
        
        return path
        
        
    }
    
    
}
