//
//  UserViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 23/04/21.
//

import Foundation
//import Firebasefire
 import FirebaseFirestore

class userViewModel: ObservableObject {
    
    @Published var users = [User1]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("books").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { (queryDocumentSnapshot) -> User1 in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
              //  let numberofPage = data["numberofPage"] as? Int ?? 0
                return User1(title: title, author: author)
            }
        }
    }
}
