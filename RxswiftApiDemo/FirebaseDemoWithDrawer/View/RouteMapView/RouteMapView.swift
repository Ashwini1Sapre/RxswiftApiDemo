//
//  RouteMapView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 28/04/21.
//

import SwiftUI
import MapKit


struct RouteMapView: View {
    
    @State private var directions: [String] = []
    @State private var showDirection = false
    var body: some View {
        VStack {
            
            MapView(directions: $directions)
            
            Button(action: {
                self.showDirection.toggle()
            }, label: {
                Text("Show Directions")
            })
            .disabled(directions.isEmpty)
            .padding()
            
        }.sheet(isPresented: $showDirection, content: {
            VStack(spacing: 0) {
               Text("Directions")
                .font(.largeTitle)
                .bold()
                .padding()
                
                Divider().background(Color.blue)
                
                List(0..<self.directions.count,  id: \.self) { i in
                    
                    Text(self.directions[i]).padding()
                }
                
            }
        })
    }
}

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    @Binding var directions : [String]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapview = MKMapView()
        mapview.delegate = context.coordinator
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapview.setRegion(region, animated: true)
        
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311))
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 22.3039, longitude: 70.8022))
        
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        
        let directins = MKDirections(request: request)
        directins.calculate { response, error in
            guard let route = response?.routes.first else { return }
                
                mapview.addAnnotations([p1, p2])
                mapview.addOverlay(route.polyline)
            
              mapview.setVisibleMapRect(route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
            self.directions = route.steps.map {
                $0.instructions }.filter { !$0.isEmpty }
            }
          return mapview
            }
            
            
        
            
            
            
    
        
   
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
      
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
}


struct RouteMapView_Previews: PreviewProvider {
    static var previews: some View {
        RouteMapView()
    }
}
