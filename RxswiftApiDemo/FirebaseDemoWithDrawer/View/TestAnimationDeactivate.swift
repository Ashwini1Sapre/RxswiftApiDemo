//
//  TestAnimationDeactivate.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI

struct TestAnimationDeactivate: View {
    @State var active: Bool = true
    var body: some View {
        VStack {
            
            if active {
                BlinkBadge()
            }
            else
            {
                Badge()
                
            }
            
        }
        .frame(width: 100, height: 100)
        .onTapGesture {
            
            self.active.toggle()
        }
    }
}


struct Badge: View {
    var body: some View {
        Circle()
    }
    
}

struct BlinkBadge: View {
    @State private var animating = false
    var body: some View {
         Circle()
            .scaleEffect(animating ? 1.081 : 1)
            .animation(Animation.default.repeatForever(autoreverses: true))
            .onAppear {
                self.animating = true
            }
        }
}


struct TestAnimationDeactivate_Previews: PreviewProvider {
    static var previews: some View {
        TestAnimationDeactivate()
    }
}
