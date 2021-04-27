//
//  MapViewDemo.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapViewDemo: UIViewRepresentable {
    

    typealias UIViewType = MKMapView
   // MKCoordinateRegion
    class Coordinator: NSObject, MKMapViewDelegate {
        @Binding var selectedPin: MapPin?
     //   @Binding var pins: [MapPin]
        
        
        
        init(selectedPin: Binding<MapPin?>) {
            
            _selectedPin = selectedPin
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            
            
            guard let pin = view.annotation as? MapPin else {
                return
            }
            pin.action?()
            selectedPin = pin
            
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            
            guard (view.annotation as? MapPin) != nil else {
                
                return
            }
            selectedPin = nil
            
        }
        
        
        
        
    }
    
    @Binding var selectedPin: MapPin?
    @Binding var pins: [MapPin]
        
 //   @Binding var selectedPin: MapPin?
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView(frame: .zero)
        view.delegate = context.coordinator
      //  view.setCamera(MKMapCameraZoomDefault, animated: true)
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = MKMapType.standard
        let myloc = CLLocationCoordinate2D(latitude: -6.863190, longitude: -79.818250)
        let coord = CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coord, span: span)
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(pins)
        if let selectedPin = selectedPin {
            uiView.selectAnnotation(selectedPin, animated: false)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedPin: $selectedPin)
    }
    
 
}



struct TestMapView: View {
    
    @State var pins: [MapPin] = [
    MapPin(coordinate: CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092),
           title: "London",
           subtitle: "Big Smoke",
           action: { print("hey mate!") })
    
    
    
    ]
    
    @State var selectedPin: MapPin?
    
    var body: some View {
        
        NavigationView {
            VStack {
                MapViewDemo(selectedPin: $selectedPin, pins: $pins)
                
                    .frame(width: 370,height: 370)
                
        
                
                if selectedPin != nil {
                    
                    Text(verbatim: "Welcome to \(selectedPin?.title ?? "????")!")
                }
                
            }
            
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    
}





struct MapViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TestMapView()
    }
}
