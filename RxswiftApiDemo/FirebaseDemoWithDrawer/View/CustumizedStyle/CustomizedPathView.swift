//
//  CustomizedPathView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 05/05/21.
//

import Foundation
import SwiftUI


struct CustomizedPathView: View {
    
   
    var body: some View {
        
        ShrikingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
    
    
}

struct CustomizedPathView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomizedPathView()
    }
    
    
}


//struct ShapeView: View {
//    
//    
//    
//    
//    
//    
//}




struct ShrikingSquares: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        for i in stride(from: 1, to: 100, by: 5){
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            
            let insetRect = rect.insetBy(dx: CGFloat(i), dy: CGFloat(i))
            path.addRect(insetRect)
            
            
        }
        
        return path
    }
    
    
    
}


