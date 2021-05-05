//
//  CustumizedToggleView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 05/05/21.
//

import Foundation
import SwiftUI

struct CustumizedToggleView: View {
    @State private var isOn = false
    var body: some View{
        Toggle("Switch Action",isOn:$isOn)
            .toggleStyle(togglestylemodule())
    }
}


struct togglestylemodule: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button{
            
            configuration.isOn.toggle()
            
        } label: {
        
        Label
        {
            configuration.label
            
            
        } icon: {
            
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle" )
                .foregroundColor(configuration.isOn ? .accentColor : .red)
                .accessibility(label: Text(configuration.isOn ? "Check" : "UnCheck"))
                .imageScale(.medium)
        }
        }.buttonStyle(PlainButtonStyle())
}

}
    
    
struct CustumizedToggleView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CustumizedToggleView()
        
    }
    
    
}

