//
//  MapShowView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapShowView: View {
  @State private var centerCoordinate = CLLocationCoordinate2D()
    
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScren = false
   // var location: MapMarker
    let marker = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365),tint: Color.red))]
    var body: some View {
        ZStack {
            
            MapNewView( selectedPlace: $selectedPlace, shwingPlaceDetail: $showingPlaceDetails,annotations: locations,centerCoordinate: $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
                .alert(isPresented: $showingPlaceDetails) {
                    
                    Alert(title: Text(selectedPlace?.title ?? "UNKonown"), message: Text(selectedPlace?.subtitle ?? "Missing plaace info"), primaryButton:  .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                        
                        self.showingEditScren = true
                        
                    }
                    
                    
                    
                    )
                }
            
                .sheet(isPresented: $showingEditScren) {
                    if self.selectedPlace != nil {
                        EditMapView(placemark: self.selectedPlace!)
                    }
                    
                    
                }
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
              Spacer()
                HStack {
                    
                    Button(action: {
                        
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "For Example"
                      //  self.locations.description = //self.marker.description
                        self.locations.append(newLocation)
                        self.selectedPlace = newLocation
                        self.showingEditScren = true
                        
    //marker.append(newLocation)
                        
                        
                        
                    })
                    {
                        Image(systemName: "plus")
                    }
                    
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            
            
        }
        
        
//        Section(header: Text("NearBy")){
//            if LoadingState  == .loaded {
//                
//                
//                
//            }
//            
            
            
            
        }
    }
    
   
    
}

struct MapShowView_Previews: PreviewProvider {
    static var previews: some View {
        MapShowView()
    }
}
