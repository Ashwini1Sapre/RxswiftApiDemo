//
//  CardModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation


struct CardModel : Identifiable, Codable {
   
    var id: Int
    var login: String
    var avatar_url: String
    var repos_url: String
    
}
