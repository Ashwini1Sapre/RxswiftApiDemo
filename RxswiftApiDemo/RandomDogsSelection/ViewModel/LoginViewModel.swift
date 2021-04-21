//
//  LoginViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI
import Combine
class LoginViewModel: ObservableObject, Identifiable {
    @Published var userName = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    
    private var disposables: Set<AnyCancellable> = []
    
    var loginHandeler = LoginHandler()
    
    @Published var woofUrl = ""
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        loginHandeler.$isLoading
            .receive(on: RunLoop.main)
            .map {
                $0
                }
                
            .eraseToAnyPublisher()
            }
    
    
        
    private var isAuthenticatePublisher: AnyPublisher<String, Never> {
        loginHandeler.$wooresponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response
                else
                {
                    return ""
                }
                return response.url ?? ""
                
            }
        
            .eraseToAnyPublisher()
        
        
        
    }
    
    
    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
        
        
        isAuthenticatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.woofUrl, on: self)
            .store(in: &disposables)
        
        
        
    }
    
    func getRandomDog(){
        
        loginHandeler.getRandomDog()
        
    }
    
    
        
        
    }
    
    
    
    

