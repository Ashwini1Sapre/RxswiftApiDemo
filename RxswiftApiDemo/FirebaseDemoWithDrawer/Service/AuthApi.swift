//
//  AuthApi.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation
import Combine
import FirebaseAuth



protocol AuthApi {
    func login(email: String, password: String) -> Future<User?, Never>
    func signUp(email: String, password: String) -> Future<User?, Never>
    
    func LoginWithFacebook() -> Future<User?, Never>
}
