//
//  ScannerViewModel.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import Foundation

class ScannerViewModel: ObservableObject {
    
    let scanInterval: Double = 1.0
    
    @Published var torchIsON: Bool = false
    @Published var lastQRCode: String = "QR code goes here"
    
    func onFoundQrCode(_ code: String)
    {
        self.lastQRCode = code
    }
    
    
    
    
}
