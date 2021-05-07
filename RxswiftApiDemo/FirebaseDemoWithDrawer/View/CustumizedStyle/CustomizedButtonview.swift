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

//for outline style for button
struct OutlineStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 64, height: 44)
            .padding(.horizontal)
            .foregroundColor(Color.accentColor)
            .background(RoundedRectangle(cornerRadius: 3))
    }
    
    
    
}

//struct for fill style of button

struct FillStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        
        
        configuration.label
            .frame(width:64, height: 44)
            .padding(.horizontal)
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .background(Color.accentColor)
            .cornerRadius(8)
        
    }
    
    
    
    
    
    
    
    
}














struct ButtonViewShow: View {
    
    var body: some View {
        
        Button("tap mee") {
            
            print("button pressed")
            
        }
        .buttonStyle(FillStyle())
        
    }
    
    
    
    
}

struct ButtonViewShow_Previews: PreviewProvider {
  
    
    
    static var previews: some View {
        
        ButtonViewShow()
        
        
    }
    
    
}
