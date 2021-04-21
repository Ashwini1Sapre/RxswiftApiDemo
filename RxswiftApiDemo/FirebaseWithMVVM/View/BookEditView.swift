//
//  BookEditView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore


struct BookEditView: View
{
    @Environment (\.presentationMode) var presentaionMode1
    @ObservedObject var viewModel = BookViewModel()
    
    
  @State private var i = 1
    var body: some View
    {
        
        Text("Edit view show")
        
        
        
    }
    
    func OnDelete()
    {
        
        viewModel.deteteBooks()
        
    }
  func OnUpdate()
  {
    
    
    
    
    
    
    
  }
    
    
    
    
    
    
    
    
}
