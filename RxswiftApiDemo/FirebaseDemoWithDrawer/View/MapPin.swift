//
//  MapPin.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import Foundation
import MapKit
class MapPin: NSObject, MKAnnotation {
    
   // MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  45.4509, longitude: 10.9924), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
  let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let action: (() -> Void)?
  
    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         subtitle: String? = nil,
         action: (
            () -> Void)? = nil) {
        
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.action = action
       
        
    }
    
    

    
    
   // let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    
    
    
}

