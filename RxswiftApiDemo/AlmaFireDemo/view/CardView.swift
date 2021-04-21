//
//  CardView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
   
    
    var name: String
    var url: String
    
    var body: some View {
       
     
        
        
        
        HStack {
            AnimatedImage(url: URL(string: url)!)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 20)
            
            VStack(alignment: .leading) {
                
                Text(name).fontWeight(.heavy)
            }
            
        }
     
        
    }
    
    
    
    
    
}
