//
//  ShowFilterImageView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
struct ShowFilterImageView: View {
    
    @State private var image: Image?
    @State private var processImage: UIImage?
    @State private var filterIntensesity = 0.7
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
   
    @State private var Cifilernew: CIFilter = CIFilter.sepiaTone()
    var context = CIContext()
    
    var body: some View {
        
        let intensity = Binding<Double>(
           get: {
               self.filterIntensesity
           },
          set: {
                   self.filterIntensesity = $0
                   self.applyProcessing()
               }
         )
        
      return NavigationView {
            VStack {
                
                ZStack {
            
                    
                Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
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
                 
                }
                
                HStack {
                    
                    Text("Intensity")
                    Slider(value: intensity)
                    
                    
                    
                }.padding(.vertical)
                
                HStack {
                    
                    Button("Change filter") {
                        self.showingFilterSheet = true
                      //change filter
                    }
                    Spacer()
                    
                    Button("Save") {
                        
                       //save the pic
                        guard let processedImage = self.processImage else {  return }
                     
                        let imagesaver = ImageSaver()
                      
                        imagesaver.successHandler = {
                            print("success handler")
                            
                        }
                        imagesaver.errorHandler = {
                            
                            print("\($0.localizedDescription)")
                            
                        }
                        
                        
                        imagesaver.writePhotoToAlbum(image: processedImage)
                        
                        
                        
                    }
                   
                    
                }
                
                
                
                
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                
                ImagePicker(image: self.$inputImage)
            }
            

            .actionSheet(isPresented: $showingFilterSheet)
            {
                ActionSheet(title: Text("Select A Filter"), buttons: [
                    .default(Text("Crystallize")){
                        self.setFilter(CIFilter.crystallize())
                    },
                    .default(Text("Edges")){
                        self.setFilter(CIFilter.edges())
                    },
                    .default(Text("Gaussian Blur")){
                        self.setFilter(CIFilter.gaussianBlur())
                    },
                    .default(Text("Pixellate")){
                        self.setFilter(CIFilter.pixellate())
                    },
                    .default(Text("Vignette")){
                        self.setFilter(CIFilter.vignette())
                    },
                    .default(Text("SepiaTone")){
                        self.setFilter(CIFilter.sepiaTone())
                    },
                 
                    .cancel()
                
                ])
                
            }
            
         
        }
        
        
    }
    
    
    func setFilter(_ filter: CIFilter) {
        
        Cifilernew = filter
        loadImage()
    }
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return }
    
        image = Image(uiImage: inputImage)
     
        let inputkeys = Cifilernew.inputKeys
        
        if inputkeys.contains(kCIInputIntensityKey) {
            Cifilernew.setValue(filterIntensesity, forKey: kCIInputIntensityKey)
        }
        
        if inputkeys.contains(kCIInputRadiusKey) {
            
            Cifilernew.setValue(filterIntensesity * 200, forKey: kCIInputRadiusKey)
            
        }
        
        if inputkeys.contains(kCIInputScaleKey) {
            
            Cifilernew.setValue(filterIntensesity * 10, forKey: kCIInputScaleKey)
        }
        
        applyProcessing()
        
    }
    func applyProcessing(){
        
        Cifilernew.setValue(filterIntensesity, forKey: kCIInputIntensityKey)
        
        guard let outputImage = Cifilernew.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        let uiImage = UIImage(cgImage: cgimg)
        image = Image(uiImage: uiImage)
        processImage = uiImage
        
        }
        //Slider(value: intensity)
    }
    
}



struct ShowFilterImageView_Previews: PreviewProvider {
    static var previews: some View {
        ShowFilterImageView()
    }
}
