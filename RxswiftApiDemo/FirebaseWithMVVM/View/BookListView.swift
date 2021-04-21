//
//  BookListView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore


enum mode {
    case new
    case edit
  
}
enum action {
    case delete
    case done
    case cancel
 
}


struct BookListView: View {
    
    @Environment(\.presentationMode) var presentationMode1
    
    @State var page = ""
    
    
    var body: some View
    {
        
        Text("Show whole book list with firebase databse")
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
