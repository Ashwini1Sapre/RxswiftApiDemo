//
//  PickerWithFrom.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI

struct PickerWithFrom: View {
    var frameworks = ["UIKIt", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedFrameworkIndex, label: Text("Favraite freamework")) {
                        ForEach(0..<frameworks.count) {
                            Text(self.frameworks[$0])
                        }
                        
                    }
                    
                    
                    
                }
                
                
                
                
                
            }
            .navigationBarTitle("Fav")
            
            
            
            
        }
        
        
        
        
    }
}

struct PickerWithFrom_Previews: PreviewProvider {
    static var previews: some View {
        PickerWithFrom()
    }
}
