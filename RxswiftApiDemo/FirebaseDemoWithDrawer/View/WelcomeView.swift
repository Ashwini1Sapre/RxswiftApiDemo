//
//  WelcomeView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

struct WelcomeView: View {
    @State private var index = 1
    @State private var pushActive = false
    @ObservedObject var state: AppState
    var body: some View {
        
        NavigationView {
   
            VStack{
                
                NavigationLink(
                    destination: destinationView(),isActive: self.$pushActive)
                    {
                    
                    EmptyView()
                }
                .navigationBarHidden(true)
                
               
                VStack {
                    
            Image(systemName: "star")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top,20)
                .colorMultiply(Color(UIConfiguration.tintbackcolor))
        
                    Text("Welcome DEmo")
                        .modifier(TextModifier(font: UIConfiguration.subtitleFont, color: UIConfiguration.tintbackcolor))
                    
                Text("Start Your app with this App"
                )
                .modifier(TextModifier(font: UIConfiguration.subtitleFont , color: UIConfiguration.tintbackcolor))
        
               // .padding(.horizontal, 23)
                    
                    VStack{
                        Button(action: {
                            self.index = 1
                            self.pushActive = true
                            
                            
                        }){
                            
                            Text("LOGIN")
                                .modifier(ButtonModifier(font: UIConfiguration.subtitleFont, color: .white, textColor: .purple, width: 275, height: 45))
                        
                        }
                        
                       
                        Button(action: {
                            self.index = 2
                            self.pushActive = true
                            
                        }){
                            Text("SIGNUP")
                                .modifier(ButtonModifier(font: UIConfiguration.subtitleFont, color: UIConfiguration.backgroundColor, textColor: .purple, width: 250, height: 45))
                            
                            
                        }
                        
                        
                        
                    }
                
                }
              
                
            }
            
          
        }
        
    }
    
    private func destinationView() -> AnyView {
        
        switch index {
        case 1:
            return AnyView(SignInView(state: state))
        default:
            return AnyView(SignUPView(state: state))
        }
        
        
    }
}

