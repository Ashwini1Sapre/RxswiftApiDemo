//
//  BookListView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore




struct BookListView: View {
    
    @Environment(\.presentationMode) var presentationMode1
    
    @StateObject var viewModel = BooksViewModel()
    @State var presentBoOkSheet = false
    
    
    
    private var addButton: some View {
        
        Button(action:  {
            self.presentBoOkSheet.toggle()
        })
        {
            Image(systemName: "plus")
        }
        
    }
    
    private func bookRowView(book: Book) -> some View {
        
    NavigationLink(
        destination: BookDetailView(book: book)){
        
        VStack(alignment: .leading)
            {
            
            Text(book.title)
                .font(.headline)
            Text("\(book.numberofPage) pages")
                .font(.subheadline)
            Text(book.author)
                .font(.subheadline)
            
        }
        
        
        
        
        
    }
        
        
        
        
        
    }
    
  
    var body: some View
    {
        NavigationView {
        List {
            
            ForEach(viewModel.books) { book in
                bookRowView(book: book)
                
                
            }
            
            
        }
        .navigationBarTitle("Books")
        .navigationBarItems(trailing: addButton)
        .onAppear() {
            
           // print()
            viewModel.subscribe()
        }
        .onDisappear() {
            
        }
        .sheet(isPresented: self.$presentBoOkSheet)
        {
           BookEditView()
        }
            
        
        }
    }
    
    
    
    
    
    
    
    
    
}
