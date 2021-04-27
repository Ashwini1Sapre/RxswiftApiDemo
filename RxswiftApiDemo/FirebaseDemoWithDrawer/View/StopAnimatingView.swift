//
//  StopAnimatingView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI


extension Animation {
    
    func `repeat` (while expression: Bool, autoreversers: Bool = true) -> Animation {
        
        if expression {
            return self.repeatForever(autoreverses: autoreversers)
            
        }
        else
        {
            
            return self
            
        }
        
        
        
    }
    
    
    
}
struct StopAnimatingView: View {
    @State var active: Bool = false
    var body: some View {
        
        
       
        
        Circle()
        .frame(width: 100, height: 100)
        .scaleEffect(active ? 1.08 : 0.1)
        .animation(Animation.default.repeat(while: active))
            
            .onTapGesture {
                
                self.active.toggle()
            }
            
       
        
        
    }
    
}

struct StopAnimatingView_Previews: PreviewProvider {
    static var previews: some View {
        StopAnimatingView()
    }
}
