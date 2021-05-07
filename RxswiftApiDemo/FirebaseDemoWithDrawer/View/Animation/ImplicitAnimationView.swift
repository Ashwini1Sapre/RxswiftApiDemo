//
//  ImplicitAnimationView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

struct ImplicitAnimationView: View {
   @State private var half = false
    @State private var dim = false
    
    
    var body: some View {
       Image("images-2")
        .scaleEffect(half ? 0.5 : 1.0)
        .opacity(dim ? 2.0 : 1.0)
        .animation(.easeInOut(duration: 0.5))
        .onTapGesture {
            
            self.half.toggle()
            self.dim.toggle()
            
        }
    }
}

struct ImplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimationView()
    }
}
