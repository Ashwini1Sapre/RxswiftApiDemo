//
//  ClockShapeAniView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

//struct ClockShapeAniView: View {
//    var body: some View {
//       // ClockShapeAniView
//    }
//}



struct ClockTime {
    var hours: Int
    var mins: Int
    var sec: Double
    
    
    init(_ h: Int, _ m: Int, _ s: Double) {
        self.hours = h
        self.mins = m
        self.sec = s
    }
    
    
    init(_ sec: Double) {
        
        let h = Int(sec) / 3600
        let m = (Int(sec) - (h * 3600)) / 60
        let s = sec - Double((h * 3600) + (m * 60))
        
        
        self.hours = h
        self.mins = m
        self.sec = s
        
    }
    
    var asSecond: Double {
        
        return Double(self.hours * 3600 + self.mins * 60) + self.sec
    }
    
    func asString() -> String {
        
//        return String(format: "%2i", self.hours)
//            + ":" +
//            String(formate: "%02i", self.mins)
//            + ":" +
//            String(formate: "%02f", self.sec)
        
       return String(format: "%2i", self.hours) + ":" + String(format: "%02i", self.mins) + ":" + String(format: "%02f", self.sec)

        
    }
    
    
    
    
}

extension ClockTime: VectorArithmetic {
    static var zero: ClockTime {
        
        return ClockTime(0,0,0)
    }
    
    
    var magnitudeSquared: Double {
        
        return asSecond * asSecond
    }
    
    
    static func -= (lhs: inout ClockTime, rhs: ClockTime) {
        lhs = lhs - rhs
        
    }
    static func += (lhs: inout ClockTime, rhs: ClockTime) {
        
        lhs = lhs + rhs
    }
    
    static func - (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
        
        return ClockTime(lhs.asSecond - rhs.asSecond)
    }
    
    static func + (lhs: ClockTime, rhs: ClockTime) -> ClockTime
    
    {
        return ClockTime (lhs.asSecond + rhs.asSecond)
        
    }
    
    mutating func scale(by rhs: Double) {
        var s = Double(self.asSecond)
        s.scale(by: rhs)
        
        let cnt = ClockTime(s)
        self.hours = cnt.hours
        self.mins = cnt.mins
        self.sec = cnt.sec
        
        
    }
    
    
    
    
    
    
}


//struct ClockShapeAniView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClockShapeAniView()
//    }
//}
