//
//  MakeACallView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI

struct MakeACallView: View {
    var phoneNumber = "718-555-5555"
    var body: some View {
        VStack {
            
            Button(action: {
                
            let phone = "tel://"
                let phoneNumberformate = phone + phoneNumber
                
                guard let url = URL(string: phoneNumberformate) else { return }
                UIApplication.shared.open(url)
                
                
                
            }) {
                Text(phoneNumber)
                    .foregroundColor(.blue)
                
            }
            
            
            
        }
    }
}

struct MakeACallView_Previews: PreviewProvider {
    static var previews: some View {
        MakeACallView()
    }
}
