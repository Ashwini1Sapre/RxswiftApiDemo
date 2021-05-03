//
//  ShowHideTransView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct ShowHideTransView: View {
    
    @State private var isShowingRed = false
    var body: some View {
        VStack{
            
            Button("Tap Mee")
                {
                withAnimation {
                self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
               // .transition(.scale)
              //  .transition(.asymmetric(insertion: .scale, removal: .opacity))
                
                .transition(.pivote)
                
            }
        }
    }
}

struct ShowHideTransView_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideTransView()
    }
}
