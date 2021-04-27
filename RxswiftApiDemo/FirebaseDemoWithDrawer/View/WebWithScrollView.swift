//
//  WebWithScrollView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 26/04/21.
//

import SwiftUI
import WebKit

struct WebWithScrollView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    func makeUIView(context: Context) -> WKWebView {
        webkit.scrollView.bounces = false
        webkit.navigationDelegate = context.coordinator
        let htmlStart = "<Html><Head><meta name=\"viewreport\"content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY>>"
        let htmlEnd = "</Body></HTMl>"
        let htmlBody = " <p> hi this swiftUI demo</p> <p>this is demo base on wkwebview </p> <p> It is stackoverflow demo </p> <p>My next trip to go delhi </p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p><p>it is our best function or trip truly</p>"
        
        let htmlstr = "\(htmlStart)\(htmlEnd)\(htmlBody)"
        webkit.loadHTMLString(htmlstr, baseURL: nil)
        return webkit
    }
    
   
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    @Binding var dheight: CGFloat
    
    var webkit: WKWebView = WKWebView()
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parrent: WebWithScrollView
        init(_ parent: WebWithScrollView) {
            self.parrent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
                DispatchQueue.main.async {
                    self.parrent.dheight = height as! CGFloat
                }
                
                
            })
        }
        
    }
   
}


struct WebWithScrollViewdemo: View {
    @State private var webViewHT: CGFloat = .zero
    var body: some View {
        
        ScrollView {
            Image(systemName: "doc")
                .resizable()
                .scaledToFit()
            
                .frame(height: 300)
            WebWithScrollView(dheight: $webViewHT)
                .padding(.horizontal)
                .frame(height: webViewHT)
            }
        }
     
}


struct WebWithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WebWithScrollViewdemo()
    }
}
