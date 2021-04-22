//
//  SignInViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation
import Combine
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

class SignInViewModel: ObservableObject {
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var satusViewModel: SatusViewModel?
    @Published var state: AppState
    
    private var cancellabeleBag = Set<AnyCancellable>()
    private let authAPI: AuthApi
    
    init(authApi: AuthApi, state: AppState) {
        self.authAPI = authApi
        self.state = state
    }
    
    func  login() {
        authAPI.login(email: email, password: password)
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with:SatusViewModel.ErrorSatus)
            .assign(to: \.satusViewModel, on: self)
            .store(in: &cancellabeleBag)
       
    }
    
    func FBLogin() {
        authAPI.LoginWithFacebook()
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: SatusViewModel.ErrorSatus)
            .assign(to: \.satusViewModel, on: self)
            .store(in: &cancellabeleBag)
        
    }
     
    
}

extension SignInViewModel {
    
    func resultMapper(with user: User?) -> SatusViewModel {
        if user != nil {
            state.currentUser = user
            return SatusViewModel.LogInSuccessSatus
        }
        else
        {
            return SatusViewModel.ErrorSatus
        }
     
    }
    
    
}
