//
//  CustomTextFeild.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI


struct CustomTextFeild: View {
   
    
    
    
    @Binding var text: String
    private let isPasswordType: Bool
    private let placeHolderText: String
    
    
    init(placeHolderText: String, text: Binding<String>, isPasswordType: Bool = false) {
        
        _text = text
        self.isPasswordType = isPasswordType
        self.placeHolderText = placeHolderText
        
        
    }
    
    
    var body: some View {
        VStack {
            if isPasswordType {
                SecureField(placeHolderText, text: $text)
                    .textFieldStyle(MyTextFieldStyle())
                
            } else {
                TextField(placeHolderText, text: $text)
                    .textFieldStyle(MyTextFieldStyle())
            }
        }
    }
    
    
    
    
}
