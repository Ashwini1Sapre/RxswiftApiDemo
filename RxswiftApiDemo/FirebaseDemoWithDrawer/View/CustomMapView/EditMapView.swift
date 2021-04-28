//
//  EditMapView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit

enum LoadingState {
    case loading, loaded, failed
}
struct EditMapView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    @State private var loadingstate = LoadingState.loading
    @State private var page = [Page]()
    var body: some View {
        
        NavigationView {
            Form {
                
                
                Section {
                    
                    TextField("placename", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubtitle)
                    
                }
                
                Section(header: Text("NearBY")) {
                    if loadingstate == .loaded {
                        List(page, id: \.pageid) { page in
                            
                            Text(page.title)
                                .font(.headline)
                           + Text(":") +
                            
                                Text(page.description)
                                .italic()
                            
                            
                            
                        }
                       
                        
                        
                        
                        
                    } else if loadingstate == .loading {
                        
                        Text("Loading")
                        
                        
                    }
                    else {
                        Text("Plese Try again latter")
                        
                    }
                    
                    
                    
                    
                }
                
                
                
            }
            
            .navigationBarTitle("Edit")
            .navigationBarItems(trailing: Button("Done")
                {
                self.presentationMode.wrappedValue.dismiss()
            })
            
            .onAppear(perform: FetchNeabyPlace)
            
            
        }
        
        
        
        
    }
    
    
    func FetchNeabyPlace() {
        
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URl: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Result1.self, from: data) {
               // self.page = Array(items.query.page.values)
                    self.page = Array(items.query.pages.values).sorted()
                self.loadingstate = .loaded
                return
                }
                
            }
            
            self.loadingstate = .failed
            
        }.resume()
        
        
    }
    
    
    
    
    
    
}

struct EditMapView_Previews: PreviewProvider {
    static var previews: some View {
        EditMapView(placemark: MKPointAnnotation.example)
    }
}
