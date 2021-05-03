//
//  ExplicitAnimattion.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct ExplicitAnimattion: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Mee"){
            
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)){
                animationAmount += 360
                
            }
            
            
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis:(x:0, y:1, z:0))
    }
}

struct ExplicitAnimattion_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimattion()
    }
}
