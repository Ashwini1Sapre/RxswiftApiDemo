//
//  AuthService.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation
import Combine
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit


class AuthService: AuthApi {
    func login(email: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            
            Auth.auth().signIn(withEmail: email, password: password) {(authResult,_) in
                guard let id = authResult?.user.providerID,
                      let  email = authResult?.user.email else
                {
                    promise(.success(nil))
                    return
                }
                
                let user = User(id: id, email: email)
                
                promise(.success(user))
                
            }
            
            
            
            
        }
    }
    
    func signUp(email: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult,_) in
                guard let id = authResult?.user.providerID,
                let email = authResult?.user.email else
                {
                    promise(.success(nil))
                    return
                    
                }
            
                let user = User(id: id, email: email)
                promise(.success(user))
                
                
                
                
            }
            
            
            
            
            
            
        }
    }
    
    
    func LoginWithFacebook() -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            
            let loginManager = LoginManager()
            loginManager.logIn(permissions: ["email"], from: nil) { (result,error) in
                
                guard let token = AccessToken.current, error == nil else {
                    
                    promise(.success(nil))
                    return
                }
                Auth.auth().signIn(with: FacebookAuthProvider.credential(withAccessToken: token.tokenString), completion: { (firebaseUser,error) in
                    if error != nil{
                        promise(.success(nil))
                        return
                    }
                    guard let id = firebaseUser?.user.providerID,
                          let email = firebaseUser?.user.email                                    else
                    {
                        
                        promise(.success(nil))
                          return
                        
                        
                    }
                    let user  = User(id: id, email: email)
                    
                 //   User(id: id, email: email)
                    promise(.success(user))
                    
                    
                    
                    
                    
                })
                
                
                
                
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
