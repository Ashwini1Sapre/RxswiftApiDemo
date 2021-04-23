//
//  IMGStorageClass.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 23/04/21.
//

import SwiftUI
//import Combine
import FirebaseStorage
import SDWebImageSwiftUI


struct IMGStorageClass: View {
    
    @State var url1 = ""
    
  @State var count = 1
   
    var body: some View {
        
        NavigationView {
        VStack {
            
            
          
            Button(action: {
                self.uploadImage1()
               
            })
            {
                
                Text("click ME")
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 40)
            }
            
            
            if url1 != "" {
            AnimatedImage(url: URL(string: url1)!)
                .frame(width: 100,height: 100)
                .clipShape(Circle())
             
        
            }
            else
            {
                
                
            }
//
          }
        .navigationBarItems(
            leading: Button(action: {
               // session.signOut()
            }, label: { Text("Logout") }),

            trailing: Button(action: {
              //  self.uploadImage()
                self.downloadimage()
            }, label: { Text("UploadImage") })
        )
     
            
        }
       // .navigationBarItems(leading: <#T##View#>, trailing: <#T##View#>)
        
        
    }

    
    
    
    func downloadimage() {
        
        let storage = Storage.storage().reference()
        storage.child("images/4.png").downloadURL{
           (url, error) in
            
            if error != nil
            {
                return
            }
            
            
            self.url1 = "\(url!)"
        
            print("url iss.... \(self.url1)")
            count = 2
            
          //  AnimatedImage(url: URL)
            
            
            
         
         
//            WebImage(url: url)
//                    .renderingMode(.original)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 32, height: 32)
//                    .clipShape(Circle())
            
        }
        
        
        
    }
    
    


    func uploadImage1() {
        
        var storageRef = Storage.storage().reference()
        
        if let image = UIImage(named: "4.png") {
            
            let data = image.pngData()
            let metadata = StorageMetadata()
            
            metadata.contentType = "images/png"
            storageRef = storageRef.child("images/4.png")
            
            let uploadTask = storageRef.putData(data!, metadata: metadata)
            
//            storageRef.downloadURL(completion:
//                                    {
//                                     (url,error) in
//                                        let uploadedImageUrl = url?.absoluteString
//
//                                    })
            
            //download image
            
            
           
            
            
            uploadTask.observe(.progress) { snapshot in
                
                let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)/Double(snapshot.progress!.totalUnitCount)
                
                print("total percentage \(percentComplete)")
                uploadTask.observe(.success) { snapshot in
                    print("image upload successfully")
                    downloadimage()
                    
                }
                
//                storageRef.downloadURL(completion: {
//                    (url,error) in
//
//                    let upladurl = url?.absoluteURL
//
//                    AnimatedImage(url: upladurl).frame(width: 200, height: 250)
//
//
//                })
                
                
                uploadTask.observe(.failure) { snapshot in
                  
                    
                    if let error = snapshot.error as NSError? {
                        
                        
                        switch (StorageErrorCode(rawValue: error.code)) {
                        case .unauthorized:
                            break
                        case .invalidArgument:
                            break
                        case .unknown:
                            break
                        case .cancelled:
                            break
                        default:
                            break
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
            }
            
            
        }
        
       
        
        
        
        
    }
    
}



    
    
    private func uplaodImage()
    {
        let imagestore = Storage.storage().reference()
        
            //  imagestore.child("4.png")
       
        if  let image2 = UIImage(named: "1.png") {
            
            
            let data = image2.pngData()
            let metaData = StorageMetadata()
            metaData.contentType = "images/png"
            
            imagestore.child("images/1.png")
            
            let uploadTSAsk = imagestore.putData(data!,metadata: metaData)
            
//            imagestore.downloadURL(completion: {
//                (url, error) in
//                let upladurl = url?.absoluteURL
//
//            })
            
            uploadTSAsk.observe(.progress) { snapshot in
                
                let percentagecompletetask = 100 * (snapshot.progress!.completedUnitCount / snapshot.progress!.totalUnitCount)
                 
                print("total percent \(percentagecompletetask)")
                
                
                
            }
            uploadTSAsk.observe(.success) { snapshot in
                print("image uplad succesfully")
                
                
            }
            uploadTSAsk.observe(.failure) { snapshot in
                print("image uplad error")
                
                
            }
            
            
            
            
//            imagestore.downloadURL (completion { (url, error) in
//                let upladurl = url?.absoluteURL
//            })
//
//
//
//
//
//            uploadTSAsk.observe(.progress)
        }
        
        
      
        
        
        
        
        
    }
    
    


struct IMGStorageClass_Previews: PreviewProvider {
    static var previews: some View {
        IMGStorageClass()
    }
}
