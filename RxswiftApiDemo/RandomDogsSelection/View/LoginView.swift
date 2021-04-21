//
//  LoginView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
   // @Binding var text: String
 //   @Binding var text1: String
    var loginButton: some View {
        NavigationLink(
            destination: DogView(url: viewModel.woofUrl),isActive: .constant($viewModel.woofUrl.wrappedValue != "")
           )
        {
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Text("get random dog").foregroundColor(.white).fontWeight(.bold)
                    Spacer()
                    
                 
                }
                Spacer()
                
                
                
            }
            .frame(minWidth: 55, minHeight: 55)
            .background(Color.blue)
            .cornerRadius(2.5)
            .padding(.top, 77)
            
            
            
        }.simultaneousGesture(TapGesture()
        
                                .onEnded{
                                    
                                    self.loginUser()
                                })
        
        
        
        
    }
    
    var placeHolderTextView: some View {
        PlaceholderTextField(placeholder: Text("Username"), text: $viewModel.userName)
            .padding(.top, 32.0)
    }
    
    var passwordTextView: some View {
        SecurePlaceholderTextField(placeholder: Text("Password"), text: $viewModel.password)
            .padding(.top, 32.0)
    }
    
    
    var titleView: some View {
        
        VStack(alignment: .leading) {
            
           Text("Welcome to")
            .tracking(1.0)
     
            
        }.padding(EdgeInsets(top: 44.0, leading: .zero, bottom: .zero, trailing: .zero))
        
        
        
        
        
    }
    
    
    
    
    
    private func loginUser() {
        viewModel.getRandomDog()
    }
    
    var body: some View {
        NavigationView {
            
            LoadingView(isshowing: .constant(viewModel.isLoading)) {
                VStack(alignment: .leading){
                    
                    self.placeHolderTextView
                    self.passwordTextView
                    
                
                   // self.placeHolderTextView
                    //self.passwordTextview
                    
                    
                    
                    self.loginButton
                    
                  Spacer()
                    
                }.padding(22)
                
                
                
                
                
            }
            
            
            
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//     //   LoginView(text: .constant(1), text1: .co)
//    }
//}
