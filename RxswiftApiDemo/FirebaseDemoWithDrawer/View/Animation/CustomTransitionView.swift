//
//  CustomTransitionView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct CustomTransitionView: ViewModifier {
    
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}


extension AnyTransition {
    
    static var pivote: AnyTransition {
        .modifier(active: CustomTransitionView(amount: -90, anchor: .topLeading), identity: CustomTransitionView(amount: 0, anchor: .topLeading))
        
    }
    
    
    
}




//struct CustomTransitionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTransitionView()
//    }
//}
