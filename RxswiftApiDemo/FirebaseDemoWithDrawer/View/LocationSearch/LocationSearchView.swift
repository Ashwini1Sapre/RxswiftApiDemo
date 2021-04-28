//
//  LocationSearchView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 28/04/21.
//

import SwiftUI
import MapKit


struct LocationSearchView: View {
    @ObservedObject var locationSearch: LocationService
   
    var body: some View {
       VStack {
            Form {
                Section(header: Text("Location Search")) {
            ZStack(alignment: .trailing) {
                
                TextField("Search", text: $locationSearch.queryFragment)
                
                if locationSearch.status == .isSearching {
                    Image(systemName: "clock")
                        .foregroundColor(Color.gray)
                  }
                
                }
              }
            Section(header: Text("Results")) {
                    List {
                        Group { () -> AnyView in
                            switch locationSearch.status {
                            case .noResults: return AnyView(Text("No result"))
                            
                            case .error(let description):
                                return AnyView(Text("error : \(description)"))
                            default: return AnyView(EmptyView())
                            }
                        }.foregroundColor(Color.gray)
                        
                    ForEach(locationSearch.searchResults, id: \.self) { completionresult in
                            
                            Text(completionresult.title)
                          
                        }
                        
                     
                    }
                   
                }
                
                
                
            }
        }
        
    }
    
    
}

//struct LocationSearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationSearchView()
//    }
//}
