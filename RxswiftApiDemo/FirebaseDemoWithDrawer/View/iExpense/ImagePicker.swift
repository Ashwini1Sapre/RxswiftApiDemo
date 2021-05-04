//
//  ImagePicker.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 03/05/21.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
  
    class Coordinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.PresentationMode.wrappedValue.dismiss()
        }
        
        
    }
    
    @Environment(\.presentationMode) var PresentationMode
    @Binding var image: UIImage?
    
    
func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
       let  picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
      
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
   
    
}


