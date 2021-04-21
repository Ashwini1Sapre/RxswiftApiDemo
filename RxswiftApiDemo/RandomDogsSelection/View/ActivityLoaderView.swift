//
//  ActivityLoaderView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI
import Combine


struct ActivityLoaderView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    let style: UIActivityIndicatorView.Style
   
    func makeUIView(context: UIViewRepresentableContext<ActivityLoaderView> ) -> ActivityLoaderView.UIViewType {
        
        return UIActivityIndicatorView(style: style)
    }
    
    
    func updateUIView(_ view: ActivityLoaderView.UIViewType, context: UIViewRepresentableContext<ActivityLoaderView>) {
        view.startAnimating()
        
    }
    
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    
    
    
}

//struct ActivityLoaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityLoaderView()
//    }
//}
