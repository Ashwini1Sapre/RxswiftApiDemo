//
//  NetworkManager.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import Foundation
import Alamofire




enum NetworkEnvirnment {
    case dev
    case production
    case stage
 
}


class NetworkManager : NSObject {
    
    static let networkEnvirment: NetworkEnvirnment = .dev
    var services = NetworkService()
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = baseURL
    var encoding: ParameterEncoding! = JSONEncoding.default
    
    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true)
   {
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)  }
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        
        if url == nil, service != nil {
            
            self.url += service!.rawValue
            print("Url is iss \(String(describing: url))")

        }
        else{
            
            self.url = url
            print("Url is iss \(String(describing: url))")
        }
        
        if !isJSONRequest{
            encoding = URLEncoding.default
            
        }
        
        self.method = method
        print("Service: \(service?.rawValue ?? self.url ?? "") \n data: \(parameters)")
        
    }
    
    
    func excuteQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers).responseData(completionHandler:  {response in
            
            switch response.result{
            
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                         
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                            
                        }
                    
                 
                    default:
                        let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                
                }
            
    
            case .failure(let error):
                completion(.failure(error))
            }
            
            
            
            
            
            
            
            
        })
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}


class Connectivity {
    
    class func isConnectedToInternet() ->Bool
    {
        
        return NetworkReachabilityManager()!.isReachable
        
    }
    
}
