//
//  MKAnnotation.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import Foundation
import MapKit

extension MKPointAnnotation: ObservableObject {
    
    public var wrappedTitle: String {
        
        get {
            self.title ?? "Unknown Value"
        }
        set {
            title = newValue
        }
        
    }
    
    public var wrappedSubtitle: String {
        
        get {
            
            self.subtitle ?? "UNknown Value"
        }
        
        set {
            
            subtitle = newValue
        }
        
    }
    
    
    
    
}
