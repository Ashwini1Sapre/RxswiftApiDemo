//
//  CustomizedIndicatorView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 06/05/21.
//

import SwiftUI


struct MyCustomProgressViewStyle: ProgressViewStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        
        let degrees = configuration.fractionCompleted! * 360
        let percent = Int(configuration.fractionCompleted! * 100)
        return VStack {
            
            CustomizedIndicatorView(startAngle: .degrees(1), endAngle: .degrees(degrees))
            
                .frame(width: 200, height: 200)
                .padding()
            Text("Task\(percent)% completed")
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
struct CustomizedIndicatorView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        return path.strokedPath(.init(lineWidth: 100,  dash: [5, 3], dashPhase: 10))
        
        
        
    }
    
    
    
    
    
}

//struct CustomizedIndicatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomizedIndicatorView()
//    }
//}
