//
//  RxLoaderView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import Foundation
import NVActivityIndicatorView
import UIKit


private let vLoader = UIView()

private let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), type: .ballRotateChase, color: UIColor.gray, padding: CGFloat(0))


struct RRLoader {
    static func startLoaderToAnimiting(_ isMask: Bool = true) {
        
        DispatchQueue.main.async {
            
            if isMask {
                
                vLoader.frame = UIScreen.main.bounds
                vLoader.backgroundColor = UIColor.black
                senceDelegate.window?.addSubview(vLoader)
             
            }
            
            activityIndicatorView.center = CGPoint(x: UIScreen.main.bounds.size.width*0.6, y: UIScreen.main.bounds.size.height*0.5)
            senceDelegate.window?.addSubview(activityIndicatorView)
           activityIndicatorView.startAnimating()
            
        }
       
    }
    
    
    static func stopLoaderToAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
       
            activityIndicatorView.stopAnimating()
            vLoader.removeFromSuperview()
         
        }
     
        
    }
    
    
}
