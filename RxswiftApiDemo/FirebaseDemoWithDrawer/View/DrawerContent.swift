//
//  DrawerContent.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

struct DrawerContent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    var body: some View {
       
        ZStack {
            Color.black
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            })
            {
                Text("Logout")
                    .modifier(TextModifier(font: UIConfiguration.buttonFont,color: .white))
                
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
}

struct DrawerView: View {
    private let width = UIScreen.main.bounds.width - 100
    @Binding var isOpen: Bool
    
    var body: some View {
        
        
        HStack {
            
            DrawerContent()
                .frame(width: self.width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.default)
            Spacer()
            
            
            
        }.onTapGesture{
            
            self.isOpen.toggle()
        }
        
        
        
    }
    
    
    
}






struct DrawerContent_Previews: PreviewProvider {
    static var previews: some View {
        DrawerContent()
    }
}
