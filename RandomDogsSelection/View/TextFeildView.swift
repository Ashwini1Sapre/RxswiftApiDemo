//
//  TextFeildView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI



private struct HorizontalLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        let fill = CGRect(x: .zero, y: .zero, width: rect.size.width, height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 3))
        return path
    }
    
    
    
    private struct HorizontalLine: View {
        
        var color: Color
        var body: some View {
            
            HorizontalLineShape()
                .fill(color)
                .frame(width: 200, height: 300, alignment: .center)
               
                
            
            
        }
        
        
        
    }
    
    
     struct plainTextFeildex: View {
       
        var placeholder: Text
        @Binding var text: String
        
        
        var body: some View
        {
           Text("asas")
            
            VStack(alignment: .leading) {
                if !text.isEmpty || text.isEmpty {
                    placeholder
                }
                
                
                
            TextField("", text: $text)
            HorizontalLine(color: .black)
                .autocapitalization(.none)
                
                
                
            }
            
        }
        
        
        
    }
    
     struct SecurTextefeild: View {
        
        
        var placeholder: Text
        @Binding var text: String
        var body: some View {
           
            if text.isEmpty  || !text.isEmpty {
                placeholder }
            Text("dsds")
            SecureField("", text: $text)
            HorizontalLine(color: .black)
            .autocapitalization(.none)
               // .auto
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
//struct TextFeildView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct TextFeildView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFeildView()
//    }
//}
