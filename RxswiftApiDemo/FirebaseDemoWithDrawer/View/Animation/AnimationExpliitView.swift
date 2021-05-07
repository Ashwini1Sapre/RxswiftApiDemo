//
//  AnimationExpliitView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

struct AnimationExpliitView: View {
    @State private var half = false
    @State private var dim = false
    
    
    var body: some View {
        Image("images-2")
            .scaleEffect(half ? 0.5 : 1.0)
            .opacity(dim ? 0.5 : 1.0)
            .onTapGesture {
                self.half.toggle()
                
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.dim.toggle()
                    
                }
                
            }
           
        
        
        
        
        
    }
}

struct AnimationExpliitView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExpliitView()
    }
}
