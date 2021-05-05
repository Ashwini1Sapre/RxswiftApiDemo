//
//  CustomizedButtonview.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 05/05/21.
//

import Foundation
import SwiftUI


struct BlueButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
           .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeIn(duration: 0.2))
        
    }
}

struct ButtonViewShow: View {
    
    var body: some View {
        
        Button("tap mee") {
            
            print("button pressed")
            
        }
        .buttonStyle(BlueButton())
        
    }
    
    
    
    
}

struct ButtonViewShow_Previews: PreviewProvider {
  
    
    
    static var previews: some View {
        
        ButtonViewShow()
        
        
    }
    
    
}
