//
//  LoadingView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI
fileprivate let loadingText = "Loding....."


struct LoadingView<content>: View where content: View {
    
    @Binding var isshowing: Bool
    var content: () -> content
    
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .center) {
                
                if(!self.isshowing){
                    
                    self.content()
                }
                else
                {
                    self.content()
                        .disabled(self.isshowing)
                        .blur(radius: self.isshowing ? 3 : 0)
                    VStack{
                        
                        
                       Text("Loading....")
                     //   Loading
                        ActivityLoaderView(style: .medium)
                       
                    }
                    
                    .frame(width: geometry.size.width/3.0, height: geometry.size.height/6.0)
                    .background(Color.pink)
                    
                    .foregroundColor(Color.white)
                    .cornerRadius(3.0)
                    .opacity(0.3)
                    
                    
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        
        
        
    }
}

//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView()
//    }
//}
