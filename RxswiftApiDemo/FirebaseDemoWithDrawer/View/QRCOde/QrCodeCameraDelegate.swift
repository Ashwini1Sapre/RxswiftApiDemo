//
//  QrCodeCameraDelegate.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import Foundation
import AVFoundation

class QrCodeCameraDelegate: NSObject, AVCaptureMetadataOutputObjectsDelegate{
    
    var scanInterval: Double = 1.0
    var lastTIme = Date(timeIntervalSince1970: 0)
    var onResult: (String) -> Void = { _ in }
    var mockData: String?
    
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metaDataObject = metadataObjects.first {
            
            guard  let readableObject = metaDataObject  as? AVMetadataMachineReadableCodeObject else {
                return
            }
            
            guard  let StringValue = readableObject.stringValue else {
                return
            }
            foundBarcode(StringValue)
            
        }
    }
    
    @objc func onSimulateScanning() {
        
        foundBarcode(mockData ?? "Simulated QR code result" )
        
    }
    
    func foundBarcode(_ stringValue: String) {
        let now = Date()
        if now.timeIntervalSince(lastTIme) >= scanInterval {
            lastTIme = now
            self.onResult(stringValue)
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
