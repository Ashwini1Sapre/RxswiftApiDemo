//
//  TestWrappedLayout.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 24/04/21.
//

import SwiftUI

struct TestWrappedLayout: View {
    @State var platforms = ["abc", "mno", "xyz", "pqr", "fgh", "try", "ewq", "jkk", "sdsd", "hiii"]
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
            
            
        }
    }
    
   
    
    private func generateContent(in g: GeometryProxy) -> some View {
        
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.platforms, id: \.self) { platform in
                
                self.item(for: platform)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                            
                        }
                        let result = width
                        if platform == self.platforms.last! {
                            width = 0
                        }
                        else
                        {
                            width -= d.width
                        }
                        
                        return result
                        
                    })
                
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if platform == self.platforms.last! {
                            height = 0
                        }
                        return result
                    })
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    func item(for text: String) -> some View {
       Text(text)
        .padding(.all,5)
        .font(.body)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(5)
        
        
        
    }
    
    
    
}

struct TestWrappedLayout_Previews: PreviewProvider {
    static var previews: some View {
        TestWrappedLayout()
    }
}
