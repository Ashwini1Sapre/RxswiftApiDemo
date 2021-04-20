//
//  DogView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
        
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
        
        
        
        
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    
}
struct AsyncImage<PlaceHolder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: PlaceHolder?
    init(url: URL, placeholder: PlaceHolder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View
    {
        image
            .onAppear(perform:
                loader.load
            )
            .onDisappear(perform:
                loader.cancel
            )
        
        
        
    }
    
    private var image: some View {
        
        Group {
            
            if loader.image != nil {
                
                Image(uiImage: loader.image!)
                    .resizable()
            }
            else
            {
                placeholder
                
            }
            
            
        }
        
    }
    
    
}







struct DogView: View {
    
    var url: String
    var body: some View {
        
        VStack(alignment: .center) {
            
            AsyncImage(url: URL(string: url)!, placeholder: Text("Loaading...")
            ).aspectRatio(contentMode: .fill)
            
            
            
        }
        
        
    }
    
    
    
    
}

//struct DogView_Previews: PreviewProvider {
//    static var previews: some View {
//        DogView()
//    }
//}
