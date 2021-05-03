//
//  UserView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI
import UIKit

class User12: ObservableObject {
    
  @Published var firstName = "abc"
  @Published var lastName = "xyz"
    
    
}
struct UserView1: View {
    @ObservedObject var user12 = User12()
    
    @State private var hideSatusBar = false
    
    var body: some View {
        Button("toggle status bar") {
            withAnimation {
                
                hideSatusBar.toggle()
                
            }
            
            
            
        }
        .statusBar(hidden: hideSatusBar)
        
    }
}


//discloser Group
struct SecondView: View {
    @State private var revealDetail =  false
    
    var body: some View {
        DisclosureGroup("show terms", isExpanded: $revealDetail) {
            
            Text("Long term and condition here long  term and condition")
        }
        .frame(width: 300)
        
       // Text("secod view")
    }
    
    
}


// Add toolbar


struct toolbarView: View {
    
    var body: some View {
        
        
        NavigationView {
            
            Text("Hello, world!").padding()
                .navigationTitle("SwiftUITool")
                .toolbar {
                    
                    ToolbarItemGroup(placement: .bottomBar){
                        
                        Button("First") {
                            
                          
                          //  Text("Pressed First")
                            print("Pressed")
                            
                        }
                        Spacer()
                        Button("Second") {
                        
                          //  Text("Pressed First")
                            print("Pressed")
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}



struct UserView1_Previews: PreviewProvider {
    static var previews: some View {
        toolbarView()
    }
}
