//
//  QRCodeScanView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

struct QRCodeScanView: View {
    @State private var isShwoingScanner = false
    @ObservedObject var viewModel = ScannerViewModel()
    var body: some View {
        
        ZStack {Text("Saccner code goes herer ")
            
            VStack {
                VStack {
                    Text("keeep Scanning for QRCode")
                        .font(.subheadline)
                    
                    Text(self.viewModel.lastQRCode)
                        .bold()
                        .lineLimit(5)
                        .padding()
                   
                }
                .padding(.vertical, 20)
                Spacer()
                                HStack {
                                    Button(action: {
                                        self.viewModel.torchIsON.toggle()
                                    }, label: {
                                        Image(systemName: self.viewModel.torchIsON ? "bolt.fill" : "bolt.slash.fill")
                                            .imageScale(.large)
                                            .foregroundColor(self.viewModel.torchIsON ? Color.yellow : Color.blue)
                                            .padding()
                                    })
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                                
                            }.padding()
            
            
            
            
        }
    }
}

struct QRCodeScanView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScanView()
    }
}
