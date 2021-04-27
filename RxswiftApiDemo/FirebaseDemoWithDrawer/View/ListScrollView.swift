//
//  ListScrollView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI


class ScrollToModel: ObservableObject {

    enum Action {
        case end
        case top
        
    }
    
    @Published var direction: Action? = nil
}


struct ListScrollView: View {
    @StateObject var vm = ScrollToModel()
    let items = (0..<200).map {
        $0
    }
    var body: some View {
        
        VStack {
            HStack {
               Button(action: {
                    vm.direction = .top
                }) {
                    Image(systemName: "arrow.up.to.line")
                        .padding(.horizontal)
                }
                Button(action: { vm.direction = .end }) {
                    Image(systemName: "arrow.down.to.line")
                        .padding(.horizontal)
                }
                
            }
            Divider()
            ScrollView {
                ScrollViewReader { sp in
                    LazyVStack {
                        
                        ForEach(items, id: \.self) { item in
                            
                            VStack(alignment: .leading) {
                                
                                Text("Item \(item)").id(items)
                                Divider()
                                }.frame(maxWidth: .infinity)
                            }
                    }
                    .onReceive(vm.$direction) { action in
                        guard !items.isEmpty else { return }
                        
                        withAnimation {
                            
                            switch action {
                            
                            case .top:
                                sp.scrollTo(items.first!, anchor: .top)
                            
                            case .end:
                                sp.scrollTo(items.last!, anchor: .bottom)
                            default:
                                return
                            
                            }
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            
            
            
            
            
            
        }
        
        
    }
}

struct ListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ListScrollView()
    }
}
