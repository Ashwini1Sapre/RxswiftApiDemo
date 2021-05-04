//
//  ImageSaver.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 04/05/21.
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ( (Error) -> Void)?
    
    
    
    func writePhotoToAlbum(image: UIImage )
    {
        UIImageWriteToSavedPhotosAlbum(image, self
                                       , #selector(saveError), nil)
    }
    
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer)
    {
        if let error = error {
            errorHandler?(error)
        }
        else {
            successHandler?()
            
        }
        
    }
    
    
    
}

