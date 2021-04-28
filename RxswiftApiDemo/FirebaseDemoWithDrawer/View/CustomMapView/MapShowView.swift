//
//  MapShowView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 27/04/21.
//

import SwiftUI
import MapKit
import CoreLocation
import LocalAuthentication
struct MapShowView: View {
  @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var isUnloacked = false
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScren = false
   // var location: MapMarker
    let marker = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365),tint: Color.red))]
    var body: some View {
     
        ZStack {
        if isUnloacked {
            MapNewView( selectedPlace: $selectedPlace, shwingPlaceDetail: $showingPlaceDetails,annotations: locations,centerCoordinate: $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
                .alert(isPresented: $showingPlaceDetails) {
                    
                    Alert(title: Text(selectedPlace?.title ?? "UNKonown"), message: Text(selectedPlace?.subtitle ?? "Missing plaace info"), primaryButton:  .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                        self.showingEditScren = true
                      })
                }
                .sheet(isPresented: $showingEditScren,onDismiss: saveData) {
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
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "For Example"
                        self.locations.append(newLocation)
                        self.selectedPlace = newLocation
                        self.showingEditScren = true
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
        }else {
            Button("UNlock Places") {
                
                self.authenticat()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
        }
            
        
        }
        .onAppear(perform: localPointSearch )
        
    }
    
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
        
    }
    
    func localPointSearch() {
        
        let fileName = getDocumentDirectory().appendingPathComponent("SavedPlace")
        do
        {
        let data = try Data(contentsOf: fileName)
        locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        }
        catch {
             print("unable to search data")
        }
      
    }
    
    func saveData() {
        
       
        do {
            let fileName = getDocumentDirectory().appendingPathComponent("SavedPlace")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
        }
        catch {
            print("Unable to save")
        }
        
        
    }
    
    func authenticat() {
        
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please authenticate tour self to unlock youself"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authicatinError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnloacked = true
                        
                    }
                    else {
                        
                        
                    }
                }
                
                
                
                
                
            }
            
        } else {
            
        }
        
        
        
    }
    
    
    
    
    
    
}

struct MapShowView_Previews: PreviewProvider {
    static var previews: some View {
        MapShowView()
    }
}
