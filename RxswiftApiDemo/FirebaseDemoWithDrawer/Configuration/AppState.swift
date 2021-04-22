//
//  AppState.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

class AppState: ObservableObject
{
    
    @Published var user: User?
    var currentUser: User?
    
    
}
