//
//  MapviewTapView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit
struct MapviewTapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
        
        var parent: MapviewTapView
        var gRecognizer = UITapGestureRecognizer()
        init(_ parent: MapviewTapView) {
            self.parent = parent
            super.init()
            self.gRecognizer = UITapGestureRecognizer(target: self, action: #selector(tabhandler))
            
            self.gRecognizer.delegate = self
            self.parent.mapView.addGestureRecognizer(gRecognizer)
        }
        
        
        @objc func tabhandler(_ gesture: UITapGestureRecognizer) {
            
            let location = gRecognizer.location(in: self.parent.mapView)
            
            let coordinate = self.parent.mapView.convert(location, to: self.parent.mapView)
        }
        
        
        
    }
    
    
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

//struct MapviewTapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapviewTapView()
//    }
//}
