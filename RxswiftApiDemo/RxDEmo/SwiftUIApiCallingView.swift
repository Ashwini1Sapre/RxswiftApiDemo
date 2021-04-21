//
//  SwiftUIApiCallingView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI
import RxSwift

struct JockData : Identifiable {
    
    public var id: Int
    public var joke: String
}



class SwiftUIApiCallingView: ObservableObject {
    
    @Published var jokes = [JockData]()
    let rxbag = DisposeBag()
    init() {
        getJocks()
    }
    
    func getJocks(count: Int = 2)
    {
        
        RxPAIMAnager.rxCall(apiURl: "http://api.icndb.com/jokes/random/\(count)", showingIndicator: true)
            .subscribeConcurrentBackgroundToMaainThreads()
            .subscribe(onNext: { response in
                
                print(response)
                if let dictinaryArray = response as? Dictionary<String,AnyObject?> {
                    
                    let jsonArray = dictinaryArray["value"]
                    if let jsonArray = jsonArray as? Array<Dictionary<String,AnyObject?>>{
                        
                        for i in 0..<jsonArray.count {
                            
                            let json = jsonArray[i]
                            if let id = json["id"]
                                as? Int, let jokeString = json["joke"] as? String {
                                self.jokes.append(JockData(id: id, joke: jokeString))
                                
                            }
                         
                        }
                      
                    }
                 
                    
                }
                    
                  
            }, onError: { error in
                
                print(error)
                
            }).disposed(by: rxbag)
                
                
                
                
            }
                
     
        
        
    }
    
    
    
    
    
    
    
    
    
    


//struct SwiftUIApiCallingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIApiCallingView()
//    }
//}
