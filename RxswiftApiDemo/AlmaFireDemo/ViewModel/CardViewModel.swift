//
//  CardViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 21/04/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

struct CardViewNew: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView {
        List(obs.dates) { i in
            CardView(name: i.login, url: i.avatar_url)
   
            
        }
        .navigationBarTitle("SwiftAlmofire")
        }
    }
  
}

struct CardViewNew_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class Observer: ObservableObject {
    @Published var dates = [CardModel]()
    init() {
        
        if !Connectivity.isConnectedToInternet() {
            
            return;
        }
       
//        NetworkManager(data: [:], url: nil, service: .orgs, method: .get, isJSONRequest: false).executeQuery()
        
        NetworkManager(data: [:], url: nil, service: .orgs, method: .get, isJSONRequest: false).excuteQuery() {
            
            (result: Result<[CardModel],Error>) in
            switch result {
            
            
            
            
            
            case .success(let response):
                print(response)
                self.dates = response
            case .failure(let error):
                print(error)
            }
            
            
        }
        
        
        
        
    }
    
    
    
    
}
