//
//  RxButton.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI

struct RxButton: View {
    
    private let action: () -> ()
    @Binding private var animationValue: CGFloat
    
    
    init(_ action: @escaping () -> (), animationValue: Binding<CGFloat> = .constant(1)) {
        self.action = action
        _animationValue = animationValue
        
    }
    
    var body: some View {
        Button(action: action ){
      Image(systemName: "plus")
            
        .padding(8)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
        Circle()
            .stroke(Color.blue)
            .scaleEffect(animationValue)
            .opacity(Double(2 - animationValue))
            .animation(
                Animation.easeOut(duration: 1)
                    .repeatForever(autoreverses: false)
            
            )
       
        )
       
        }
    }
}

