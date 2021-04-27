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
 
struct Page: Codable {
    
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    
}


