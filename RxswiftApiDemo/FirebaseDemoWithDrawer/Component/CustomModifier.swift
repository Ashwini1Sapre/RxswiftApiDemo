//
//  CustomModifier.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation
import SwiftUI
struct TextModifier: ViewModifier {
    private let font: UIFont
    private let color: UIColor
    
    init(font: UIFont, color: UIColor = .black) {
        self.font = font
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
        
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom(font.fontName, size: font.pointSize))
            .foregroundColor(Color(color))
            .multilineTextAlignment(.center)
            .lineLimit(nil)
       
    }
}
    
    struct ShadowModifier: ViewModifier {
        let color: UIColor
        
        
        func body(content: Content) -> some View {
            content
                .shadow(color: Color(color), radius: 5, x: 3, y: 3)
        }
        
        
    }
    
    
    
    struct ButtonModifier: ViewModifier {
        private let font: UIFont
        private let color: UIColor
        private let textColor: UIColor
        private let width: CGFloat?
        private let height: CGFloat?
        
        init(font: UIFont,
             color: UIColor,
             textColor: UIColor = .white,
             width: CGFloat? = nil,
             height: CGFloat? = nil) {
            self.font = font
            self.color = color
            self.textColor = textColor
            self.width = width
            self.height = height
        
        
        }
        
       
        
        func body(content: Content) -> some View {
            content
                .modifier(TextModifier(font: font, color: textColor))
                .padding()
                .frame(width: width, height: height)
                .background(Color(color))
                .cornerRadius(25)
            
            
        }
        
        
        
        
        
    }
    
    
    
    struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 25,
                                     style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
