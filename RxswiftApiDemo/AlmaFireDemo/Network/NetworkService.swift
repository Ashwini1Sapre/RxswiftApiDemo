//
//  NetworkService.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation

enum services :String {
    case orgs = "users/hadley/orgs"
    case users = "users/"
    
    
}


var baseURL: String {
    
    switch NetworkManager.networkEnvirment {
    case .dev: return "https://api.github.com/"
    case .production: return "https://api.github.com/"
    case .stage: return "https://api.github.com/"
   
    }
    
    
    
}

class NetworkService : NSObject {}
