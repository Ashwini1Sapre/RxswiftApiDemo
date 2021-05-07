//
//  CustomizedProgressView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 05/05/21.
//

import Foundation
import SwiftUI


struct CustomizedProgressView: View {
    @State private var progress = 0.2
    
    var body: some View {
      //  Text("seccc")
        ProgressView(value: progress, total: 1.0)
        .progressViewStyle(MyCustomProgressViewStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                
                if progress < 1.0 {
                    
                    withAnimation {
                        
                        progress += 0.2
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
        
        
    }
   
    
}

struct GaugeProgressStyle: ProgressViewStyle {
    
    var strokeColor = Color.blue
    var strokeWidth = 25
    
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            
            Circle()
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(-90))
                        
            
            
        }
        
        
        
    }
    
    
    
    
    
    
}

struct CustomizedProgressView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustomizedProgressView()
    }
    
    
    
}
