//
//  ClockAnimationView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 08/05/21.
//

import SwiftUI


struct MyButton: View {
    
    let label: String
    var font: Font = .title
    var textColor: Color = .white
    let action: () -> ()
  
    var body: some View {
        Button(action: {
            
            self.action()
            
        }, label: {
            
            Text(label)
                .font(font)
                .padding(10)
                .frame(width: 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(textColor)
         
        })
     
    }

}

struct ClockAnimationView: View {
    
    @State private var time: ClockTime = ClockTime(9, 50, 5)
    @State private var duration: Double = 2.0
    
    
    var body: some View {
        VStack {
            
    ClockShape(clockTime:  time)
        .stroke(Color.blue, lineWidth: 3)
        .padding(20)
        .animation(.easeInOut(duration: duration))
        .layoutPriority(1)
            
            Text("\(time.asString())")
            HStack(spacing: 20) {
                MyButton(label: "9:51:43", font: .footnote, textColor: .black) {
                    self.duration = 2.0
                    self.time = ClockTime(9, 51, 43)
                    
                }
                
                MyButton(label: "9:51:15", font: .footnote, textColor: .black ) {
                    
                    self.duration = 2.0
                    self.time = ClockTime(9, 51, 15)
                }
                
                MyButton(label: "10:01:45", font: .caption, textColor: .black ) {
                    
                    self.duration = 10.0
                    self.time = ClockTime(10, 01, 45)
                }
              
            }
          
        }
        .navigationBarTitle("Example").padding(.bottom, 50)
    }
}

struct ClockAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ClockAnimationView()
    }
}
