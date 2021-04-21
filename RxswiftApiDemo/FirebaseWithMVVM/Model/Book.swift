//
//  Book.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Book: Identifiable, Codable {
  @DocumentID  var id: String?
    
    
   var title: String
  var author: String
  var numberofPage: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case numberofPage = "pages"
        
        
        
    }
    
    
    
}
