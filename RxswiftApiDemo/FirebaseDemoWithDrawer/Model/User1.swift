//
//  User1.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 23/04/21.
//

import Foundation
import FirebaseFirestoreSwift


struct User1: Identifiable {
    var id: String? = UUID().uuidString
    var title: String
    var author: String
}
