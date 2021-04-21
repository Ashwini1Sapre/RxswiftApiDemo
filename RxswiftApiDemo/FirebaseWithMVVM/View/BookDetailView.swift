//
//  BookDetailView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore




struct  BookDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditBookSheet = false
    
    
    var book: Book
    
    private func editButton(action: @escaping () -> Void) -> some View
    {
        
        Button(action: {
            action()
        })
        {
            
            Text("Edit")
        }
        
        
    }
    
    
    
    var body: some View
    {
        Form {
            
            Section(header: Text("Book"))
                {
                Text(book.title)
                
                Text("\(book.numberofPage)")
            }
            
            Section(header: Text("Author"))
                {
                
                Text(book.author)
            }
            
            
            
            
            
            
        }
        .navigationBarTitle(book.title)
        .navigationBarItems(trailing: editButton {
            self.presentEditBookSheet.toggle()
        })
     
        onAppear() {
            print("\(self.book.title)")
        }
        .onDisappear() {
            
            print("BookDetailView.OnDisappear()")
        }
        .sheet(isPresented: self.$presentEditBookSheet)
            {
            BookEditView(viewModel: BookViewModel(book: book), mode: .edit)
                { result in
                
                if case .success(let action) = result, action == .delete {
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                
            }
            
            
            
            
        }
        
        
    }
}



