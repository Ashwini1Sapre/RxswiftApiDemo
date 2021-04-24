//
//  AnimatingImageDemoView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 24/04/21.
//

import SwiftUI

struct AnimatingImageDemoView: View {
    @State private var speaker: SpeakerSymbol = .speakerempty
  
    var body: some View {
        VStack {
            Color.clear
                .modifier(AnimateImageView(symbol: speaker))
                .frame(width: 80, height: 80)
            Divider()
            Button("Toggle") {
            
            withAnimation{
                self.speaker = (self.speaker == .speakerempty ? .speaker3 : .speakerempty)
            }
            
          }
            
      }
    }
}

struct AnimatingImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingImageDemoView()
    }
}
