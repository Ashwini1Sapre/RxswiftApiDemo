//
//  OwnWindowView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI

struct OwnWindowView: EnvironmentKey {
   
    #if canImport(UIKit)
    typealias WrappedValue = UIWindow
    #elseif canImport(AppKit)
    typealias WrappedValue = NSWindow
    #else
    #error("Unsupported Platfrom")
    #endif
    
    typealias Value = () -> WrappedValue?
    
    static let defaultValue: Self.Value = { nil }
    
    
    
}


extension EnvironmentValues {
    var hostingWindow: OwnWindowView.Value {
        get {
            return self [OwnWindowView.self]
        }
        
        set {
            self[OwnWindowView.self] = newValue
            
        }
        
    }
   
}

struct OwnWindowViewNew: View {
    @Environment(\.hostingWindow) var hostingWindow
    
    var body: some View {
        VStack {
            Button("Action") {
                
                print("Welcome")
                
                
            }
            
        }
        
    }
   
}


