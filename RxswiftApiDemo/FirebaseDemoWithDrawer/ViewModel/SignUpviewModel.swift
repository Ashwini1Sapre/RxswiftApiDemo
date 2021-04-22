//
//  SignUpviewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation
import Combine

class SignUpviewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var PhoneNumber: String = ""
    @Published var stusviewModel: SatusViewModel?
    @Published var state: AppState
    private var cancellableBag = Set<AnyCancellable>()
    private let authAPI: AuthApi
    
    init(authAPI: AuthApi, state: AppState) {
        self.authAPI = authAPI
        self.state = state
    }
    
    func signUP() {
        
        authAPI.signUp(email: email, password: password)
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: SatusViewModel.ErrorSatus)
            .assign(to: \.stusviewModel, on: self)
            .store(in: &cancellableBag)
        
    }
   
}

extension SignUpviewModel {
    
     func resultMapper(with user: User?) -> SatusViewModel {
        if user != nil {
            state.currentUser = user
            return SatusViewModel.SignUPSuccessStatus
        }
        else
        {
           return SatusViewModel.ErrorSatus
        }
    }
    
}
