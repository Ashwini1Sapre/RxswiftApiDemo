//
//  PickerView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI

struct PickerView: View {
    
    @State private var colours = ["red","orange","yellow","blue","violet","purple"]
    @State public var selection: Int
    @State private var pickerVisible = false
    @State private var count = 0
  //  @Binding var selection1: Int
    var body: some View {
        
        VStack {
            
            DropdownPicker(title: "Size", selection: $selection, options: ["Small", "Medium", "Large","X-Large"])
            
//            Text("Picker Tutorial")
//                .font(.largeTitle)
//                .foregroundColor(.gray)
//            List {
//                
//                HStack {
//                    
//                    Text("color")
//                    Spacer()
//                    Button(colours[selection]) {
//                        
//                        if self.pickerVisible {
//                            
//                            self.count += 1
//                        }
//                        self.pickerVisible.toggle()
//                        
//                    }
//                    
//                    .foregroundColor(self.pickerVisible ? .red : .blue)
//                }
//                
//                
//                if pickerVisible {
//                    HStack {
//                        
//                        Spacer()
//                        Picker(selection: $selection, label: Text("")) {
//                            ForEach(0..<colours.count) {
//                                Text(self.colours[$0]).foregroundColor(.secondary)
//                            }
//                            
//                            
//                        }
//                        
//                        .onTapGesture {
//                            self.count += 1
//                            self.pickerVisible.toggle()
//                            
//                            
//                        }
//                        Spacer()
//                     
//                    }
//                    
//                  
//                    
//                }
//                
//                HStack {
//                    
//                    Text("no of selections")
//                    Spacer()
//                    Text("\(count)")
//                   
//                }
//                
//            }
//            .padding()
//            
//            
        }
        
        
        
        
        
        
        
    }
}

//struct PickerView_Previews: PreviewProvider {
//
//    @Binding  static var selection1: Int
//    static var previews: some View {
//      //  PickerView(selection: <#Binding<Int>#>)
//        DropdownPicker(title: "Size", selection: $selection1, options: ["Small", "Medium", "Large","X-Large"])
//    }
//}
