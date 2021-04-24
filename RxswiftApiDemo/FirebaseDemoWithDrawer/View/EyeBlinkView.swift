//
//  EyeBlinkView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 23/04/21.
//

import SwiftUI

struct EyeBlinkView: View {
    
    enum EyeState: String {
        
      //  UIImage(named: "eyes-open"),UIImage(named: "eyes-closed")
        case open =  "images-3"
        case close =  "images-2"
    }
    
    @State private var eyeSatte = EyeState.open
    
    
    
    var body: some View {
        
        Image(eyeSatte.rawValue).resizable().scaledToFit()
         //   .frame(width: 100, height: 100, alignment: .center)
        .onAppear() { self.blink() }
    }
    
    private func blink() {
        
        self.eyeSatte = .close
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.eyeSatte = .open
            DispatchQueue.main.asyncAfter(deadline:
            DispatchTime.now().advanced(by: .seconds(Int.random(in: 1..<9)))){
                self.blink()
            }
            
        }
       
    }
    
}

struct EyeBlinkView_Previews: PreviewProvider {
    static var previews: some View {
        EyeBlinkView()
    }
}
