//
//  DropdownPicker.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI

struct DropdownPicker: View {
    var title: String
    @Binding var selection: Int
    var options: [String]
    
    @State private var showOption: Bool = false
    
    
    var body: some View {
       
        
        ZStack{
            
          
            HStack{
                Text(title)
                Spacer()
                Text(options[selection])
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
              
            }
            .font(Font.custom("Avenir Next", size: 16).weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical,8)
            .background(Color.white)
            .onTapGesture {
                withAnimation(Animation.spring().speed(2)) {
                    showOption = true
                    
                }
                
            }
            
            
            
            if showOption {
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(title)
                        .font(Font.custom("Avenir Next", size: 16).weight(.semibold))
                        .foregroundColor(.white)
                    HStack {
                       Spacer()
                        ForEach(options.indices, id: \.self) { i in
                            
                            if i == selection {
                                Text(options[i])
                                    .font(.system(size: 12))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal,12)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(4)
                                    .onTapGesture {
                                        
                                        withAnimation(Animation.spring().speed(2))
                                            {
                                            showOption = false
                                        }
                                        
                                    }
                            }
                            else {
                                Text(options[i])
                                    .font(.system(size: 12))
                                    .onTapGesture {
                                        
                                        withAnimation(Animation.spring().speed(2)) {
                                            selection = i

                                            showOption = false
                                        }
                                    }
                                
                            }
                               Spacer()
                                
                                
                            }
                            
                            
                            
                        }
                    .padding(.vertical, 2)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        
                        
                        
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical, 8)
                    .transition(.opacity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    
                }
            
                
            }
            
            
           
            
        }
        
        
        
    }


//struct DropdownPicker_Previews: PreviewProvider {
//    static var previews: some View {
//       // DropdownPicker(title: "Size", selection: $se, options: ["Small", "Medium", "Large","X-Large"])
//        
//        
//        DropdownPicker(title: "Size", selection: $selection, options: ["Small", "Medium", "Large","X-Large"])
//    }
//}
