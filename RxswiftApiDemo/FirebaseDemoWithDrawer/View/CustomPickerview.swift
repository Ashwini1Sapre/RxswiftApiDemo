//
//  CustomPickerview.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI

struct CustomPickerview: View {
    @State private var selctedIndex = 0
    private var titles = ["Rounded Trip", "One Way" ,"Multi City"]
    private var colors = [Color.red, Color.green, Color.blue]
    @State private var frames = Array<CGRect>(repeating: .zero, count: 3)
    
    var body: some View {
      
        VStack {
            ZStack {
                HStack(spacing: 10) {
                    
                    ForEach(self.titles.indices, id: \.self) { index in
                        
                        Button(action: {
                            self.selctedIndex = index}) {
                               
                            Text(self.titles[index])
                                
                               
                        }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)).background(GeometryReader { geo in
                            
                            Color.clear.onAppear {
                                
                                self.setFrame(index: index, frame: geo.frame(in: .global))
                            }
                            
                            
                        })
                            
                      }
                        
                }
                .background(Capsule().fill(
                    self.colors[self.selctedIndex].opacity(0.4))
                                .frame(width: self.frames[self.selctedIndex].width, height: self.frames[self.selctedIndex].height, alignment: .topLeading)
                
                                .offset(x: self.frames[self.selctedIndex].minX - self.frames[0].minX),alignment: .leading
                        )
                    
               }
            .animation(.default)
            .background(Capsule().stroke(Color.gray, lineWidth: 3))
                
            Picker(selection: $selctedIndex, label: Text("What is your faav color")){
                ForEach(0..<self.titles.count) { index in
                    Text(self.titles[index]).tag(index)
                    
                }
                
                }.pickerStyle(SegmentedPickerStyle())
                Text("Value: \(self.titles[self.selctedIndex])")
                Spacer()
                
                
            }
            
          
        }
        
    func setFrame(index: Int, frame: CGRect)
    {
        self.frames[index] = frame
    }
    
}

struct CustomPickerview_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerview()
    }
}
