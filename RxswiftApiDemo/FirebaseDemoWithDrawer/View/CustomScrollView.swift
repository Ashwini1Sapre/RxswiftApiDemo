//
//  CustomScrollView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 24/04/21.
//

import SwiftUI

struct CustomScrollView: View {
    @State private var objects = ["0", "1"]
    
    var body: some View {
       
        NavigationView {
            
            VStack {
                
                
                customScrollmodel(scrollToEnd: true) {
                    ForEach(self.objects, id: \.self) { object in
                        VStack {
                            Text("Row \(object)").padding().background(Color.yellow)
                            NavigationLink(
                                destination: Text("detail for \(object)"))
                                {
                                   Text("Link")
                                 }
                            Divider()
                            
                          
                        }.overlay(RoundedRectangle(cornerRadius: 8).stroke())
                        
                        
                        
                    }
                    
                    
                    
                    
                }
                .navigationBarTitle("ScrollToEnd", displayMode: .inline)
                
                
                HStack {
                    Button(action: {
                        self.objects.append("\(self.objects.count)")
                    })
                    {
                        Text("Add")
                    }
                    Button(action: {
                        if !self.objects.isEmpty {
                            self.objects.removeLast()
                        }
                    })
                    {
                        Text("Remove")
                        
                    }
                    
                }
                
                
            }
            
            
            
            
        }
        
        
        
    }
}



struct customScrollmodel<Content>: View where Content : View {
   
    var axces: Axis.Set = .vertical
    var reversed: Bool = false
    var scrollToEnd: Bool = false
    var content: () -> Content
    
    @State private var ContentHeight: CGFloat = 0
    @State private var ContentOffSet: CGFloat = 0
    @State private var ScrollffSet: CGFloat = 0

    
    
    var body: some View {
        
        //Text("welcomr")
        GeometryReader { geomerty in
            if self.axces == .vertical
            {
                self.veritcal(geometry: geomerty)
            }
            else
            {
                
                
            }
            
            
            
            
        }
        .clipped()
        
        
        
    }
    
    private func veritcal(geometry: GeometryProxy) -> some View {
        
        VStack {
            content()
        }
        .modifier(viewHeightKey())
        .onPreferenceChange(viewHeightKey.self){
            self.updateHeight(with: $0, outerHeight: geometry.size.height)
        }
        .frame( height: geometry.size.height, alignment: (reversed ? .bottom : .top))
        .offset(y: ContentOffSet + ScrollffSet)
        .animation(.easeInOut)
        .background(Color.white)
        .gesture(DragGesture()
                    .onChanged { self.onDragChange($0) }
                    .onEnded { self.onDragEnded ($0, outerHeight: geometry.size.height) }
        
        )
        
    }
    
    
   
    private func onDragChange(_ value: DragGesture.Value)
    {
        self.ScrollffSet = value.location.y - value.startLocation.y
      
    }
    
    private func onDragEnded(_ value: DragGesture.Value, outerHeight: CGFloat)
    {
        let scrollOffset = value.predictedEndLocation.y - value.startLocation.y
        self.updateOffset(with: scrollOffset, outerHeight: outerHeight)
        self.ScrollffSet = 0
        
    }
    
    private func updateHeight(with height: CGFloat, outerHeight: CGFloat) {
        
        
        let delta = self.ContentHeight - height
        self.ContentHeight = height
        if scrollToEnd {
            
            self.ContentOffSet = self.reversed ? height - outerHeight - delta : outerHeight - height
        }
        if abs(self.ContentOffSet) > .zero
        {
            self.updateOffset(with: delta, outerHeight: outerHeight)
        }
        
        
    }
    
    private func updateOffset(with delta: CGFloat, outerHeight: CGFloat) {
        
        let topHeight = self.ContentHeight - outerHeight
        if topHeight < .zero {
            self.ContentOffSet = .zero
        }
        else
        {
            var proposedOffSet = self.ContentHeight + delta
            if (self.reversed ? proposedOffSet : -proposedOffSet) < .zero {
                proposedOffSet = 0
                
            }
            else if (self.reversed ? proposedOffSet : -proposedOffSet) > topHeight {
                proposedOffSet = (self.reversed ? topHeight : -topHeight)
                
            }
            self.ContentOffSet = proposedOffSet
        }
        
        
    }
    
    
}

struct viewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = value + nextValue()
    }
    
    
}
extension viewHeightKey: ViewModifier {
    func body(content: Content) -> some View {
        return content.background(GeometryReader{ proxy in
            Color.clear.preference(key: Self.self, value: proxy.size.height )
        })
    }
    
}


struct CustomScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CustomScrollView()
    }
}
