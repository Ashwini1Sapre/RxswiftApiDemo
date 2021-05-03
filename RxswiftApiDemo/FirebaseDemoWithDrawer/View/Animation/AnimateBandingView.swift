//
//  AnimateBandingView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct AnimateBandingView: View {
    @State private var animationAmont: CGFloat = 1
    var body: some View {
        VStack {
            
            Stepper("Scale amt", value: $animationAmont.animation(), in: 1...10)
            Spacer()
            Button("Tap Me") {
                
                self.animationAmont += 1
            }
             
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmont)
            
            
            
            
            
            
            
        }
    }
}

struct AnimateBandingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateBandingView()
    }
}
