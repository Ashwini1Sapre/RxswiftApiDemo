//
//  SignUPView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI

struct SignUPView: View {
    @ObservedObject private var viewModel: SignUpviewModel
    @State var pushActive = false
    
    
    init(state: AppState) {
        self.viewModel = SignUpviewModel(authAPI: AuthService(), state: state)
    }
    var body: some View {
       
        VStack {
            NavigationLink(
                destination: SignInView(state: viewModel.state),
                isActive: self.$pushActive
               )
            {
                EmptyView()
            }.hidden()
            VStack(alignment: .center)
            {
            Text("SignUp")
                .modifier(TextModifier(font: UIConfiguration.titleFont, color: UIConfiguration.tintbackcolor))
                .padding(.leading, 25)
                VStack(alignment: .center) {
                    CustomTextFeild(placeHolderText: "FullName", text: $viewModel.fullName)

                    CustomTextFeild(placeHolderText: "Email", text: $viewModel.email)
                    CustomTextFeild(placeHolderText:
                                        "PhoneNumber", text: $viewModel.PhoneNumber)
                    CustomTextFeild(placeHolderText: "Password", text: $viewModel.password)
                    
                    
                    
                }
                
                VStack(alignment: .center) {
                    
                    customButton(title: "Create Account", backgroundColor: UIColor.red, action: self.viewModel.signUP)
                    
                }
           
        }
            Spacer()
      
    }
        .alert(item: self.$viewModel.stusviewModel) { status in
        Alert(title: Text(status.title),
        
              message: Text(status.message),
              dismissButton: .default(Text("cancel"),
                                      action: {
                self.pushActive = true
              })
        
        )
        
   
        
        
        
    }
    
    
    }



    private func customButton(title: String, backgroundColor: UIColor,action:@escaping () -> Void) -> some View {
        
        Button(action: action
        ){
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont, color: backgroundColor, textColor: .white, width: 275, height: 45))
            
            
            
        }
        
        
        
        
    }

}
//struct SignUPView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUPView()
//    }
//}
