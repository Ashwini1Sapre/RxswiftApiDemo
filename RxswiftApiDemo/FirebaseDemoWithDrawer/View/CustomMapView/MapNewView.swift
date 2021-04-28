//
//  MapNewView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit
import Foundation


struct Marker: Identifiable {
    
    let id = UUID()
    var location: MapMarker
    
}



struct MapNewView: UIViewRepresentable {
    
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var shwingPlaceDetail: Bool
    
    
    var annotations: [MKPointAnnotation]
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @State private var annotaion = MKPointAnnotation()
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapview = MKMapView()
        mapview.delegate = context.coordinator
        return mapview
     
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        print("Updating")
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
        
            
            uiView.addAnnotations(annotations)
        }
        
    }
    
    
   
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
      class  Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapNewView
        init(_ parent: MapNewView) {
            self.parent = parent
        }
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }
            parent.selectedPlace = placemark
            parent.shwingPlaceDetail = true
        }
        
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
            
            let identifier = "placemark"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                
                annotationView = MKPinAnnotationView(annotation: annotation , reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
                
                
                
                
                
                
            }
            else
            {
                
                annotationView?.annotation = annotation
                
            }
            
            
           return annotationView
            
            
            
        }
        
    }
    
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2021"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
        
    }
   
}
struct MapNewView_Previews: PreviewProvider {
    static var previews: some View {
        MapNewView(
                  
                       selectedPlace: .constant(MKPointAnnotation.example),
                       shwingPlaceDetail: .constant(false),
            annotations: [MKPointAnnotation.example],
            centerCoordinate: .constant(MKPointAnnotation.example.coordinate)
        )
            .edgesIgnoringSafeArea(.all)
    }
}
