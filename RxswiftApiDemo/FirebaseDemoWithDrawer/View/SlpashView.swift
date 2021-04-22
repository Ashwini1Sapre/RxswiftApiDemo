//
//  SlpashView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

struct SlpashView: View {
    @State var isActive:Bool = false
    @ObservedObject var state: AppState
    
    
    var body: some View {
        VStack {
            if self.isActive {
                
              WelcomeView(state: state)
                
                Spacer()
            }
            else
            {
                ZStack {
                    Color(UIConfiguration.tintbackcolor)
                        .edgesIgnoringSafeArea(.all)
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        //.background(UIColor.systemPink)
                    
                    
                }
                
                
                
                
                
                
            }
            
         
        }
        .onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            
            
            
        }
    }
}



struct SlpashView_Previews : PreviewProvider
{
    
    static var previews: some View {
        SlpashView(state: AppState())
        
    }
    
    
    
    
}

