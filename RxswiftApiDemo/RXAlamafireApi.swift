//
//  RXAlamafireApi.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Alamofire


public struct RxPAIMAnager: ObservableType {
    
    public typealias Element = Any
    var apiUrl: String
    var httpMethod: HTTPMethod
    var param: [String:Any]?
    var showingIndicator: Bool = false
    
    static var manager : Session = {
        
        let confi = URLSessionConfiguration.default
        confi.timeoutIntervalForRequest = 1200.0
        return Alamofire.Session(configuration: confi)
    
    }()
    
    
    static private func header() -> HTTPHeaders {
        
        var header = HTTPHeaders()
        header["Content-Type"] = "application/json"
        return header
     
    }
    
    
    static private func encoding(_ httpMethod: HTTPMethod) -> ParameterEncoding {
        var encoder : ParameterEncoding = JSONEncoding.default
        if httpMethod == .get {
            
            encoder = URLEncoding.default
        }
        return encoder
        
    }
    
    
    public func subscribe<Observer>(_ observer: Observer) -> Disposable where Observer : ObserverType, RxPAIMAnager.Element == Observer.Element {
        
        if showingIndicator {
            
            RRLoader.startLoaderToAnimiting()
          
        }
        
        
        let task = RxPAIMAnager.manager.request(apiUrl, method:httpMethod, parameters: param, encoding: RxPAIMAnager.encoding(httpMethod), headers: RxPAIMAnager.header())
            
            
        
            .responseJSON { (response) in
                RRLoader.stopLoaderToAnimating()
                
                if response.response?.statusCode == SatusCode.unAuthorized.rawValue
                {
                    observer.onError(NSError(domain: response.request?.url?.absoluteString ?? "", code: SatusCode.unAuthorized.rawValue, userInfo: nil))
                    
                    return
                    
                }
                
                
                switch response.result {
                
                case .success :
                    observer.onNext(response.value as RxPAIMAnager.Element)
                    observer.onCompleted()
                break
                case .failure(let error):
                    if(error as NSError).code == SatusCode.noInternetConnection.rawValue
                    {
                        observer.onError(NSError(domain: response.request?.url?.absoluteString ?? "", code: SatusCode.noInternetConnection.rawValue, userInfo:nil))
                    
                        
                    }
                    else
                    {
                        observer.onError(error)
                    }
                    
                    break
                
                }
             
            }
        
        task.resume()
        return Disposables.create {
            task.cancel()
        }
        
    }
    
    
    
    
    
}


extension RxPAIMAnager {
    
    public static func rxCall(apiURl: String, httpMethod: HTTPMethod = .get, param: [String:Any]? = nil, showingIndicator: Bool = false) -> Observable<Element>
       {
        
        return Observable.deferred {
            
          return RxPAIMAnager(apiUrl: apiURl, httpMethod: httpMethod, param: param, showingIndicator: showingIndicator)
         .asObservable()
            
        }
        
        
        
//        return Observable.deferred {
//
//            return RxPAIMAnager(apiUrl: apiURl,
//                                httpMethod: httpMethod,
//                                param: param,
//                                showingIndicator: showingIndicator)
//                .asObservable()
        }
   
        
    }
    


extension ObservableType {
    
    public func subscribeConcurrentBackgroundToMaainThreads() -> Observable<Element>
    {
        return
            self.subscribe(on: RXScheduler
                                .concurrentBackground)
            .observe(on: RXScheduler.main)
       
        
//        return
//            self.subscribe(onNext: RXScheduler.concurrentBackground)
//            .observe(on: RXScheduler.main)
        
    }
     
}


public struct RXScheduler {
    static let main = MainScheduler.instance
    static let concurrentMain = ConcurrentMainScheduler.instance
    static let serialBackground = SerialDispatchQueueScheduler.init(qos: .background)
    static let concurrentBackground = ConcurrentDispatchQueueScheduler.init(qos: .background)
    static let serialUtility = SerialDispatchQueueScheduler.init(qos: .utility)
    static let concurentutilty = ConcurrentDispatchQueueScheduler.init(qos: .utility)
    static let serialUser = SerialDispatchQueueScheduler.init(qos: .userInitiated)
    static let concurrentUser = ConcurrentDispatchQueueScheduler.init(qos: .userInitiated)
    
    static let serialIntactive = SerialDispatchQueueScheduler.init(qos: .userInteractive)
    static let concurentIntractive = ConcurrentDispatchQueueScheduler.init(qos: .userInteractive)
    
    
}


enum SatusCode: Int {
    case ok = 200
    case create = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unAuthorized = 401
    case forbidden = 403
    case noFound = 404
    case methodNotAllow = 405
    case conflict = 409
    case serverError = 500
    case unavilable = 503
    case requestTimeout = 408
    case noInternetConnection = -1009
    
    
    
    
    
    
}
//
//struct RXAlamafireApi_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
