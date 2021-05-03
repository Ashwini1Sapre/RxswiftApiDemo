//
//  FlipCardView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 30/04/21.
//

import SwiftUI

struct FlipCardView: View {
    @State var showBack = false
    
    let sample1 = "i am swift developer, c"
    let sample2 = "i sdsds kdmsmdls  dsdsf"
    var body: some View {
       
        let front = CardType(text: sample1, background: Color.yellow)
        let back = CardType(text: sample2, background:Color.red)
        
        let resetBackButton = Button (action: {self.showBack = true }) {
            Text("Back")}.disabled(showBack == true)
        
        
        let resetFrontButton = Button (action: { self.showBack = false
        }) {
            Text("Front")
        }.disabled(showBack == false)
        
        let animationToggle =  Button(action: {
            withAnimation(Animation.linear(duration: 0.8)) {
                
                self.showBack.toggle()
            }
        })
        {
            
            Text("toggle")
        }
        
        return
            VStack() {
                
                HStack() {
                    resetFrontButton
                    Spacer()
                    animationToggle
                    Spacer()
                    resetBackButton
                    
                    
                    
                    
                    
                }.padding()
               Spacer()
                FlipView(front: front, back: back, showBack: $showBack)
                Spacer()
                
            }
        
        
        
        
        
        
        }
    
        
        
        
    }



struct FlipView<SomeTypeOfViewA : View, SomeTypeOfViewB : View> : View {
    
    var front : SomeTypeOfViewA
    var back : SomeTypeOfViewB
    @State private var flipped = false
    @Binding var showBack : Bool

    
    var body: some View {
        return VStack {
            Spacer()
            ZStack() {
                
                front.opacity(flipped ? 0.0 : 1.0)
                back.opacity(flipped ? 1.0 : 0.0)
            }
            .modifier(FlipEffect(flipped: $flipped, angle: showBack ? 180 : 0, axis: (x: 1, y: 0)))
            
            .onTapGesture {
                
                withAnimation(Animation.linear(duration: 0.8)) {
                    self.showBack.toggle()
                }
                
                
                
            }
            Spacer()
            
            
            
        }
        
        
        
        
    }
    
    
    
}



struct FlipEffect: GeometryEffect {
    
    var animatableData: Double {
        get { angle }
        
        set { angle = newValue }
        
    }
    
    @Binding var flipped: Bool
    var angle: Double
    let axis : (x: CGFloat, y:CGFloat)
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        
        let tweanedAngle = flipped ? -180 + angle : angle
        let a = CGFloat(Angle(degrees: tweanedAngle).radians)
        var transferd3d = CATransform3DIdentity
        transferd3d.m34 = -1/max(size.width, size.height)
        transferd3d = CATransform3DRotate(transferd3d, a, axis.x, axis.y, 0)
        transferd3d = CATransform3DTranslate(transferd3d, -size.width/2.0, -size.height/2.0, 0)
        
        let afflinetransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0))
        
        return ProjectionTransform(transferd3d).concatenating(afflinetransform )
    }
    
    
    
}



struct CardType<SomeTypeView: View> : View {
    var text : String
    var background: SomeTypeView
    
    var body: some View {
        
        Text(text)
            .multilineTextAlignment(.center)
            .padding(5).frame(width: 250, height: 150).background(background)
        
        
    }
    
    
    
    
    
    
    
}




struct FlipCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlipCardView()
    }
}
