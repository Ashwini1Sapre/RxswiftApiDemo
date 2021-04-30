//
//  UserView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI


class User {
    
    var firstName = "abc"
    var lastName = "xyz"
    
    
}
struct UserView: View {
    @State private var user = User()
    
    
    
    var body: some View {
        VStack {
        Text("Your Name is \(user.firstName) \(user.lastName).")
            
            TextFeild("First Name", text: $user.firstName)
            TextFeild("Last Name", text: $user.lastName)
        
        
        }
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
