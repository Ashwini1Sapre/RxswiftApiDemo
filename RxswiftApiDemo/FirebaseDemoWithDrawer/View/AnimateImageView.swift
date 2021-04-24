//
//  AnimateImageView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 24/04/21.
//

import SwiftUI

struct AnimateImageView: AnimatableModifier {
    var symbol: SpeakerSymbol
    private var animating: Double
   
    init(symbol: SpeakerSymbol) {
        self.symbol = symbol
        self.animating = Double(symbol.rawValue)
    }
    
   
    var anumatableData: Double {
        get { animating }
        set { animating = newValue }
    }
    
    
    func body(content: Content) -> some View {
        return SpeakerSymbol(rawValue: Int(animating))!.image
    }
    
}

enum SpeakerSymbol: Int, CaseIterable {
    case speakerempty,speaker1,speaker2,speaker3
    var image: some View {
    var name: String
    
    switch self {
    case .speakerempty: name = "speaker.fill"
    case .speaker1: name = "speaker.wave.1"
    case .speaker2: name = "speaker.wave.2"
    case .speaker3: name = "speaker.wave.3"
        
    }
        
    return Image(systemName: name).font(.largeTitle)
   
  }

}

