//
//  Result.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import Foundation

struct Result1: Codable {
    
    let query: Query
}

struct Query: Codable {
    
    let pages: [Int: Page]
    
}
 
struct Page: Codable , Comparable{
    
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    var description: String {
        
        terms?["description"]?.first ?? "No futur information"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        
        lhs.title < rhs.title
    }
    
    
    
    
}


