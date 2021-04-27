//
//  DragdropReOrtextview.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI
import UniformTypeIdentifiers

struct LettersData: Identifiable , Equatable {
    
    let id: Int
    let letter: String
    
}

class Model1: ObservableObject {
    
    @Published var letters: [LettersData] = []
    init(input: String) {
        let inputArray = Array(input).map(String.init)
        
        for i in 0..<inputArray.count {
            letters.append(LettersData(id: i, letter: inputArray[i]))
        }
    }
    
    
    
}

struct TryingDrag: View {
    @StateObject private var model = Model1(input: "BeginSave")
    @State private var dragging: LettersData?
    
    var body: some View {
        
        HStack (spacing: 0){
            ForEach(model.letters) { letter in
                LettersDrag(letter: letter.letter )
                    .onDrag{
                        self.dragging = letter
                        return  NSItemProvider(object: String(letter.id) as NSString)
                    }
                    .onDrop(of: [UTType.text] , delegate: DragRelocateDelegate1(item: letter, listData: $model.letters, current: $dragging))
                
            }
            
            
            
        }.animation(.default,value: model.letters)
        
        
    }
    
    
}



struct LettersDrag: View {
    let letter: String
    var body: some View {
        Text(letter).foregroundColor(.white)
            .padding(5)
            .font(.title)
            .background(Color.red)
            .animation(.spring())
        
        
        
    }
    
    
    
}


struct DragRelocateDelegate1: DropDelegate {
  
    
    let item: LettersData
    @Binding var listData: [LettersData]
    @Binding var current : LettersData?
    
    func dropEntered(info: DropInfo) {
        if item != current {
            
            let from = listData.firstIndex(of: current!)!
            let to = listData.firstIndex(of: item)!
            
            if listData[to].id != current!.id {
                
                listData.move(fromOffsets: IndexSet(integer: from), toOffset: to>from ? to + 1 : to)
                
            }
            
            
        }
    }
    
    func performDrop(info: DropInfo) -> Bool {
        self.current = nil
        return true
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    
    
    
    
}


