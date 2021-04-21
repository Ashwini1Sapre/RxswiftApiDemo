//
//  LoginHandler.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import Combine
import Alamofire

class LoginHandler: APIHandler {
 
    @Published var wooresponse: WoofResponse?
    
    @Published var isLoading = false

    func getRandomDog() {
   
        isLoading = true
        let url = "https://random.dog/woof.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<WoofResponse,AFError>)in
            
            guard let  weakself = self else { return }
            guard let response = weakself.handelResponse(response) as? WoofResponse else {
                weakself.isLoading = false
                return
            }
            weakself.isLoading = false
            weakself.wooresponse = response
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
