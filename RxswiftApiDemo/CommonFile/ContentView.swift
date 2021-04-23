//
//  ContentView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 20/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiObserved = SwiftUIApiCallingView()
    
    @State private var animationAmount: CGFloat = 1
   
    var body: some View {
        
        
        
        TabView {
           
            
            
            
            NavigationView{
                
                List(apiObserved.jokes){i in
                HStack{Text(i.joke)}.navigationBarItems(trailing: RxButton(getNewJoke, animationValue: $animationAmount).onAppear {
                   self.animationAmount = 2
                    }
                )
                    .navigationBarTitle("SwiftUI API Calling")
                
                }
             
            }
            .tabItem { Label("API", systemImage: "star") }
            
            
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

            
         CardViewNew().environment(\.managedObjectContext, context)
            
                .tabItem { Label("API", systemImage: "scribble") }
            
            BookListView()
                .tabItem { Label("Book", systemImage:"book") }
            
                LoginView()
           //EyeBlinkView()
            //    UserView()
                  //  IMGStorageClass()
            .tabItem { Label("Menu",systemImage: "plus") }
            
            SlpashView(state: AppState())
                .tabItem {
                    
                    
                    Label("Auth", systemImage: "slider.horizontal.3")
                }
            
            
            
            
            
        }
        
//        NavigationView{
//
//            List(apiObserved.jokes){i in
//            HStack{Text(i.joke)}.navigationBarItems(trailing: RxButton(getNewJoke, animationValue: $animationAmount).onAppear {
//               self.animationAmount = 2
//                }
//            )
//                .navigationBarTitle("SwiftUI API Calling")
//
//            }
//
//        }
     
    }
    
    func getNewJoke() {
        
        
        apiObserved.getJocks(count: 1)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
