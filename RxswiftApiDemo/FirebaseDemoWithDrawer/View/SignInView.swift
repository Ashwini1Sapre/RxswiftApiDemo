//
//  SignInView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject private var viewModel: SignInViewModel
    @State var isActive = false
    
    init(state: AppState) {
        self.viewModel = SignInViewModel(authApi: AuthService(), state: state)
    }
    
    var body: some View {
        
        VStack {
            NavigationLink(
                destination: HomeView(state: viewModel.state),isActive: self.$isActive) {
                
                EmptyView()
              
            }.hidden()
            
            VStack(alignment: .center){
                
              Text("Login")
                .modifier(TextModifier(font: UIConfiguration.titleFont, color: UIConfiguration.tintbackcolor))
                .padding(.top, 20)
                VStack(alignment: .center) {
                    
                    CustomTextFeild(placeHolderText: "UserName or Email", text: $viewModel.email)
                    
                    CustomTextFeild(placeHolderText: "Password", text: $viewModel.password)
                
                    
                }.padding(.horizontal,20)
                
                
                VStack(alignment: .center)
                {
                    CustomButton(title: "Login", backgroundColor: UIConfiguration.tintbackcolor, action: self.viewModel.login)
                    
                    Text("OR")
                    
                    CustomButton(title: "FBLogin", backgroundColor: UIConfiguration.tintbackcolor, action: self.viewModel.FBLogin)
                    
                    
                    
                    
                }
                
                
                
                
            }
            Spacer()
            
            
            
            
            
            
            
            
            
            
        }
        
        .alert(item: self.$viewModel.satusViewModel){
            status in
            
            Alert(title: Text(status.title), message: Text(status.message), dismissButton: .default(Text("OK"),action: {
                if status.title == "Successfuly Login" {
                self.isActive = true
                }
            }))
            
        }
        
        
        
        
        
    }
    
    
    private func CustomButton(title: String, backgroundColor: UIColor, action: @escaping() -> Void) -> some View {
    
        Button(action: action){
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont, color: backgroundColor,textColor: .white, width: 270, height: 45))
            
            
        }
    
    
    
    
    }
    
    
}


struct SignInView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignInView(state: AppState())
    }
    
    
}
