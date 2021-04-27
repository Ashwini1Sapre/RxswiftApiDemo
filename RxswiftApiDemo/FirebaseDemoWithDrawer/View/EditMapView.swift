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
                            
                            Text("page description")
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
            
            
        }
        
        
        
        
    }
    
    
    func FetchNeabyPlace() {
        
        
        
    }
    
    
    
    
    
    
}

struct EditMapView_Previews: PreviewProvider {
    static var previews: some View {
        EditMapView(placemark: MKPointAnnotation.example)
    }
}
