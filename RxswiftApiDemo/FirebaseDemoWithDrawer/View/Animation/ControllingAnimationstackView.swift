//
//  ControllingAnimationstackView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct ControllingAnimationstackView: View {
    
    @State private var enable = false
    var body: some View {
        Button("Tap Mee") {
            self.enable.toggle()
        }
//        .background(Color.blue)
//        .frame(width: 200, height: 200)
//        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(enable ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
       // .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
       
    }
    
  //  Butoo
    
    
    
    
    
    
}

struct ControllingAnimationstackView_Previews: PreviewProvider {
    static var previews: some View {
        ControllingAnimationstackView()
    }
}
