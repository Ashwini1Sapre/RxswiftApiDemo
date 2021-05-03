//
//  ShowFilterImageView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI

struct ShowFilterImageView: View {
    
    @State private var image: Image
    @State private var filterIntensesity = 0.5
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    
                    
                    
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil{
                           image
                           .resizable()
                            .scaledToFit()
                        
                    }
                    
                    else
                    {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                    
                    
                }
                .onTapGesture{
                    
                    self.showingImagePicker = true
                    
                  //select image
                    
                    
                }
                
                HStack {
                    
                    Text("INtensity")
                    Slider(value: self.$filterIntensesity)
                    
                    
                    
                }.padding(.vertical)
                
                HStack {
                    
                    Button("Change filter") {
                      //change filter
                    }
                    Spacer()
                    
                    Button("Save") {
                        
                       //save the pic
                    }
                    
                    
                    
                }
                
                
                
                
            }
            .padding([.horizontal, .bottom])
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                
                ImagePicker(image: self.$inputImage)
            }
            .navigationBarTitle("Instafilter")
            
            
            
            
            
            
        }
        
        
    }
    
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        
    }
    
    
}

//struct ShowFilterImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowFilterImageView()
//    }
//}

struct ShowFilterImageView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
