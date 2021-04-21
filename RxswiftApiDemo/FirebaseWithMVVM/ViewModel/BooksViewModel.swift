//
//  BooksViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import Combine
import FirebaseFirestore


class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    private var db = Firestore.firestore()
    private var listnerRegistration: ListenerRegistration?
    
    deinit {
        Unsubscribe()
    }
    
    func Unsubscribe()
    {
        if listnerRegistration != nil{
            listnerRegistration?.remove()
            listnerRegistration = nil
        }
        
        
     
    }
    
    
    func subscribe() {
        
        if listnerRegistration == nil {
            
            listnerRegistration = db.collection("book").addSnapshotListener {
                (querySnapshot, error) in
                
                guard let document = querySnapshot?.documents else {
                print("no document")
                    return
                }
                self.books = document.compactMap
                {
                    queryDocumentSnapshot in
                    return try? queryDocumentSnapshot.data(as: Book.self)
                    
                    
                }
                 
                
            }
                
            
        }
    
    }
    
    
    func removeBook(atOffSet indexSet: IndexSet) {
        
        let books = indexSet.lazy.map{self.books[$0]}
        
        books.forEach { book in
            
            if let documentId = book.id {
                
                db.collection("book").document(documentId).delete { error in
                    
                    print("error is \(String(describing: error))")
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
  
}
