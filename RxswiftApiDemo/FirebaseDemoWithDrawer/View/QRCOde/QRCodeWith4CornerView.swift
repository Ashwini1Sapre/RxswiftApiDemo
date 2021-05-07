//
//  QRCodeWith4CornerView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

struct QRCodeWith4CornerView: View {
    var body: some View {
        Text("Hello, World!")
            .frame(width: 275, height: 275)
            .overlay(
             Rectangle()
                .stroke(Color.yellow, style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .bevel, dash: [65,215], dashPhase:  29))
            
            
            )
    }
}

struct QRCodeWith4CornerView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeWith4CornerView()
    }
}
