//
//  AnimatedGestureView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct AnimatedGestureView: View {
    @State private var animationValue = CGSize.zero
    @State private var enable = false
    
    
     let letters = Array("Hello Swift")
    var body: some View {
        
        
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enable ? Color.red : Color.blue)
                    .offset(self.animationValue)
                    .animation(Animation.default.delay(Double(num)/20))
              
                
                
                
            }
            
            
            
            
            
            
        }
        .gesture (
            DragGesture()
            .onChanged { self.animationValue = $0.translation }
                .onEnded{ _ in
                    
                    withAnimation(.spring()) {
                        self.animationValue = .zero
                    }
                    
                    
                    
                    
                }
        
        
        
        )
        
        
//
//        LinearGradient(gradient: Gradient(colors: [.red,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(animationValue)
//            .gesture(
//             DragGesture()
//                .onChanged { self.animationValue = $0.translation }
//                .onEnded{ _ in
//
//                    withAnimation(.spring()) {
//                    self.animationValue = .zero
//                 }
//
//                }
//            )
        }
}

struct AnimatedGestureView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGestureView()
    }
}
