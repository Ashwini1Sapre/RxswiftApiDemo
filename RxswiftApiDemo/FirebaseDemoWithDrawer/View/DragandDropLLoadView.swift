//
//  DragandDropLLoadView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct GridData: Identifiable, Equatable {
     
    let id: Int
}

class Model: ObservableObject {
    @Published var data: [GridData]
    let columns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(160))
    ]
    init() {
        data = Array(repeating: GridData(id: 0), count: 50)
        for i in 0..<data.count {
           // data[i] = GridData(id: i)
            
            data[i] = GridData(id: i)
        }
        
    }
}


struct DemoDragRelocateView: View {
    
    @StateObject private var model = Model()
    @State private var dragging: GridData?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: model.columns, spacing: 32) {
                ForEach(model.data){ d in
                    GridItemView(d: d)
                        .overlay(dragging?.id == d.id ? Color.white.opacity(0.8) : Color.clear)
                    
                        .onDrag{
                            self.dragging = d
                            return NSItemProvider(object: String(d.id) as NSString)
                            }
                        .onDrop(of: [UTType.text], delegate: DragRelocateDelegate(current: $dragging))
                    
                }
             
            }.animation(.default, value: model.data)
            
            }
          
        }
       
    }
    
struct GridItemView: View {
    
    var d: GridData
    var body: some View {
        VStack {
            Text(String(d.id))
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 160, height: 240)
        .background(Color.green)
    }
    
}

struct DragRelocateDelegate: DropDelegate {
   @Binding var current: GridData?
   
    func performDrop(info: DropInfo) -> Bool {
        current = nil
        return true
    }
    
    
    
}




