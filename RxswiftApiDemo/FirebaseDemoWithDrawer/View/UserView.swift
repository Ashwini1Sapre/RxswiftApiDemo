//
//  UserView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 23/04/21.
//

import SwiftUI
import MapKit

struct UserView: View {
    
    @ObservedObject private var viewModel = userViewModel()
    @State private var selection = 0
    @State private var selection1: MKMapType = .standard
    
    
    var body: some View {
       
        NavigationView {
            
          //  print("\(viewModel.users)")
            
            VStack(alignment: .leading) {
            Picker("Select an appearanse", selection: $selection) {
            Text("light").tag(0)
            Text("Dark").tag(1)
            Text("Automatic").tag(2)
            }
                Picker("Map type", selection: $selection1)
                    {
                    Text("Standard").tag(0)
                    Text("Satelite").tag(1)
                    Text("Hybrid").tag(2)
                    
                    
                }.pickerStyle(SegmentedPickerStyle())
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    
                    Text(user.author).font(.title)
                    Text(user.title).font(.subheadline)
                  
                }
                
             
            }
            .navigationBarTitle("Users")
            
            .onAppear() {
                
                self.viewModel.fetchData()
            }
            
            
        }
        
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
