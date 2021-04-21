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

enum Mode {
    case new
    case edit
  
}
enum Action {
    case delete
    case done
    case cancel
 
}

struct BookEditView: View
{
    @Environment (\.presentationMode) var presentaionMode1
    @ObservedObject var viewModel = BookViewModel()
   @State var presentatoionActionSheet = false
    
  @State private var i = 1
    var mode: Mode = .new
    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    var cancelButton: some View{
        Button(action: {
            self.AddDeleteTap() })
            {
            
            Text("Cancel")
        }
        
    }
    
    var saveButton: some View {
        Button(action:  {
            self.AddAddTap()
        })
        {
            Text (mode == .new ? "Done" : "Edit")
            
        }
        .disabled(!viewModel.modified)
    }
    
    
    var body: some View
    {
        
       // Text("Edit view show")
        
        NavigationView {
            
            Form {
            
            Section(header: Text("Book"))
            {
                TextField("Title",text: $viewModel.book.title)
                TextField("Numberr of Page", value: $viewModel.book.numberofPage,formatter: NumberFormatter())
           
            }
            
            Section(header: Text("Author"))
            {
                
                TextField("Author", text: $viewModel.book.author)
             
            }
            
            if mode == .edit
            {
                Section {
                Button("Delete Book") {
                    
                    self.presentatoionActionSheet.toggle()
                       
                }
                .foregroundColor(.pink)
               }
            }
        
            }
        
        .navigationTitle(mode == .new ? "New book" : viewModel.book.title)
        
        .navigationBarTitleDisplayMode(mode == .new ? .inline : .automatic)
        
        .navigationBarItems(leading: cancelButton, trailing: saveButton)
        .actionSheet(isPresented: $presentatoionActionSheet)
            {
            
            ActionSheet(title: Text("Are you sure?"), buttons: [
                .destructive(Text("Delete book"),
                             
                             action: {
                                
                                
                                self.AddDeleteTap()
                             }
                             ),
                .cancel()
            
            ])
            
            
            
        }
        
    }
    }
    
    
    
    
    //handel button tab action
    func handelCancelButton()
    {
        self.dismiss()
    }
    
    func AddDeleteTap()
    {
        self.viewModel.deteteBooks()
        self.dismiss()
        self.completionHandler?(.success(.delete))
        
    }
    
    
    func AddAddTap()
    {
        self.viewModel.handelDoneTab()
        self.dismiss()
        
    }
    
    
    func dismiss()
    {
        self.presentaionMode1.wrappedValue.dismiss()
        
    }
 
    
    
    
    
    
    
    
    
}


struct BookEditView_previews: PreviewProvider {
    
    static var previews: some View {
        BookEditView()
    }
    
    
}
