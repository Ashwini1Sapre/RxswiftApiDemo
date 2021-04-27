//
//  ReapetingAnimationView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI

struct ReapetingAnimationView: View {
    @State private var isAnimating = false
    @State private var showProgress = false
    
    var foreverAnimation: Animation {
        
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
        
    }
    
    
    
    var body: some View {
        Button(action: {  self.showProgress.toggle() }, label: {
            if showProgress {
                
                Image(systemName: "arrow.triangle.2.circlepath").frame(width: 35, height: 40)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0.0))
                    .animation(self.isAnimating ? foreverAnimation : .default)
                    .onAppear { self.isAnimating  = true }
                    .onDisappear { self.isAnimating = false }
                
            }else {
                
                Image(systemName: "arrow.triangle.2.circlepath")
            }
        })
        .onAppear { self.showProgress = true }
    }
}

struct ReapetingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ReapetingAnimationView()
    }
}
