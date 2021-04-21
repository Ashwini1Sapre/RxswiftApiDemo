//
//  BookViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import FirebaseFirestore
import Combine

class BookViewModel: ObservableObject {
    
    @Published var book: Book
    @Published var modified = false
    
    private var cancellble = Set<AnyCancellable>()
    
    
    init(book: Book = Book(title: "", author: "", numberofPage: 0)) {
        
        self.book = book

        self.$book
            .dropFirst()
            .sink{[weak self] book in
                self?.modified = true
                
            }
            .store(in: &self.cancellble)
        
    }
    
    private var db = Firestore.firestore()
    
    private func addBook(_ book: Book)
    {
        do {
            print("\(book)")
            let booklist = try db.collection("books").addDocument(from: book)
            print("\(booklist)")
            
        }
        catch
        {
            print(error)
        }
        
      
    }
    
    private func updateBook(_ book: Book)
    {
        if let documentId = book.id {
        do {
            try db.collection("books").document(documentId).setData(from: book)
       
        }
        catch {
            
            print(error)
          }
       
      }
    }
    
    private func updateORAddBook()
    {
        
        if let _ = book.id {
            
            self.updateBook(self.book)
          
        }
        else{
           
            self.addBook(book)
        }
     
        
    }
    func deteteBooks()
    {
        
        if let documentId = book.id {
           
           db.collection("books").document(documentId).delete() {
            error in
              if let error = error  {
               print("\(error.localizedDescription)")
              }
                
           }
        
        }
    
    }
    
    
    func handelDoneTab() {
        
        self.updateORAddBook()
    }
    
    
    func handelDeleteTab() {
        
        self.deteteBooks()
    }
    
    
}


