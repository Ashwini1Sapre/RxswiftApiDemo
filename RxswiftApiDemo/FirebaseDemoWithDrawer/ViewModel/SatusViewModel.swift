//
//  SatusViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import Foundation

class SatusViewModel: ObservableObject, Identifiable {
    
    var title: String
    var message: String
    init(title: String = "",message: String = "") {
        self.title = title
        self.message = message
    }
    
    static var SignUPSuccessStatus: SatusViewModel {
        return SatusViewModel(title: "Successfuly SignUp", message: "Your account successfuly created")
        
    }
    
    static var LogInSuccessSatus: SatusViewModel {
        return SatusViewModel(title: "Successfuly Login", message: "You are login Successfuly")
    }
    
    static var ErrorSatus: SatusViewModel {
        
        return SatusViewModel(title: "Error", message: "Some Thing Went wrong")
    }
    
    
    
    
    
    
}
