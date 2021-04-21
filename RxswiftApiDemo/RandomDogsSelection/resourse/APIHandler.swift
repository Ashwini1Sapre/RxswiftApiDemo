//
//  APIHandler.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import Alamofire
import Combine

class APIHandler {
    
    var statusCode = Int.zero
    func handelResponse<T:Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
    
        switch response.result {
        case .success:
            return response.value
        case . failure:
            return nil
        }
      
    }
 
}
