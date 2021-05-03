//
//  AnimationDemo.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct AnimationDemo: View {
    @State private var animationAmount: CGFloat = 1
    @State private var isSapping: Bool = true
    var body: some View {
    
        
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.blue)
                .frame(width: 270 , height: 270)
            
            
            Image(systemName: "forword.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(isSapping ? 0 : 360))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
        }
        .onAppear() {
            
            self.isSapping.toggle()
        }
        
       
            
            
        
        
       // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Tap Me") {
            
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
       // .animation(Animation.easeInOut(duration: 1)
                   // .delay(1)
                    //  .repeatCount(3, autoreverses: true)
                 //   .repeatForever(autoreverses: true)
       // )
        
        .overlay(
             Circle()
            .stroke(Color.red)
            .scaleEffect(animationAmount)
            .opacity(Double(2 - animationAmount))
        
        .animation(Animation.easeOut(duration: 1)
                .repeatForever(autoreverses: false)
        
        )
        )
        .onAppear{
            
            self.animationAmount = 2
        }
        
        
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
