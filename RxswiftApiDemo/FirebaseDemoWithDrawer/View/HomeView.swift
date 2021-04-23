//
//  HomeView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 22/04/21.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI
struct HomeView: View {
    @State var isDrawerOpen: Bool = false
    @ObservedObject var state: AppState
    @ObservedObject var viewmodel = userViewModel()
    
    @State var url1 = ""
 //   @ObservedObject var url = usrl
    
  
    var body: some View {
        ZStack {
        NavigationView {
            
           
            
            
        
            
            
            VStack(alignment: .leading)
            {
            
                Text("Welcome \(state.currentUser?.email ?? "Not found")")
                
              //  Spacer()
            List(viewmodel.users) { user in
                
                Text(user.title).font(.headline)
                Text(user.author).font(.subheadline)
          
          
            }
                if url1 != ""
                {
                    
                    AnimatedImage(url: URL(string: url1)!)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    
                }
            }
            
           
            
            
            .navigationTitle("UserHome")
            .onAppear {
                
                self.viewmodel.fetchData()
            
            }
            
                .navigationBarItems(leading:
                                        Button(action: {self.isDrawerOpen.toggle()} )
                                        {
                                        Image(systemName: "sidebar.left")
                                            
                                        }
                                    
                )
            
            
        }
        DrawerView(isOpen: self.$isDrawerOpen)
        
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarItems(
            leading: Button(action: {
              //  session.signOut()
            }, label: { Text("Logout") }),

            trailing: Button(action: {
              //  self.uploadImage()
                self.uploadImage()
            }, label: { Text("UploadImage") })
        )
       // .navigationBarHidden(true)
    }
    

    
    func showimage() {
        
        let storageref = Storage.storage().reference().child("images/4.png")

        storageref.downloadURL{
           (url,error) in
            
            if error != nil {
                return
            }
            
            self.url1 = "\(url!)"
            
            
            
        }
            
            
        
        
        
        
        
    }
    
    
    
    
    
    func uploadImage() {
        
        var storageRef = Storage.storage().reference()
        
        if let image = UIImage(named: "1.png") {
            
            let data = image.pngData()
            let metadata = StorageMetadata()
            
            metadata.contentType = "images/png"
            storageRef = storageRef.child("images/1.png")
            
            let uploadTask = storageRef.putData(data!, metadata: metadata)
            
            storageRef.downloadURL(completion:
                                    {
                                     (url,error) in
                                        let uploadedImageUrl = url?.absoluteString
                                        
                                    })
            
            uploadTask.observe(.progress) { snapshot in
                
                let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)/Double(snapshot.progress!.totalUnitCount)
                
                print("total percentage \(percentComplete)")
                uploadTask.observe(.success) { snapshot in
                    print("image upload successfully")
                    self.showimage()
                    
                }
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


