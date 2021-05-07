//
//  BarCodeScanView.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 07/05/21.
//

import SwiftUI
import AVFoundation

public struct CodeScannerView : UIViewControllerRepresentable {
    
    public enum ScanError: Error {
        
        case badInput, badOutput
    }
    public enum ScanMode {
        case once, oncePreCode, continous
    }
    
    public let codeTypes: [AVMetadataObject.ObjectType]
    public let scanMode: ScanMode
    public let scanInterval: Double
    public let showViewfinder: Bool
    public var simulatedData = ""
    public var completion: (Result<String, ScanError>) -> Void
    
    public class ScannerCoordinator: NSObject,AVCaptureMetadataOutputObjectsDelegate {
        
        var parent: CodeScannerView
        var codeFound: Set<String>
        var isFinishScanning = false
        var lastTime = Date(timeIntervalSince1970: 0)
       
        init(parent: CodeScannerView) {
            self.parent = parent
            self.codeFound = Set<String>()
            
        }
        
        public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            
            if let metadataObject = metadataObjects.first {
                
                
                guard let readableObject = metadataObjects as? AVMetadataMachineReadableCodeObject else {
                    return
                }
                
                guard let stringValue = readableObject.stringValue else {
                    return
                }
                guard isFinishScanning == false else {
                    return
                }
                
               switch self.parent.scanMode {
                
               case .once:
                found(code: stringValue)
                isFinishScanning = true
                
               case .oncePreCode:
                if !codeFound.contains(stringValue) {
                    codeFound.insert(stringValue)
                    found(code: stringValue)
                    
                    
                }
               case .continous:
                if isPastScanInterval() {
                    
                    found(code: stringValue)
                }
                
                }
                
                
                
                
                
                
            }
            
            
            
            
        }
        func isPastScanInterval() -> Bool {
            
            return Date().timeIntervalSince(lastTime) >=  self.parent.scanInterval
        }
        
        func found(code: String) {
            lastTime = Date()
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            parent.completion(.success(code))
            
        }
        func didFail(reason: ScanError) {
            
            parent.completion(.failure(reason))
        }
        
        
        
        
        
        
        
    }
    
    #if targetEnvironment(simulator)
    public class ScannerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        
        var delegate: ScannerCoordinator?
        private let showViewfinder: Bool
        
        
        public init(showViewfinder: Bool = false) {
            
            self.showViewfinder = showViewfinder
            super.init(nibName: nil, bundle: nil)
        }
        required  init?(coder: NSCoder) {
            fatalError("init(coder)has not been implemented")
        }
        
        override public func loadView() {
            view = UIView()
            view.isUserInteractionEnabled = true
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            
            label.text = "you are test on simulator tab simulator to show data"
            label.textAlignment = .center
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("on tab here to select system image", for: .normal)
            button.setTitleColor(UIColor.systemBlue, for: .normal)
            button.setTitleColor(UIColor.gray, for: .highlighted)
            button.addTarget(self, action: #selector(openGallay), for: .touchUpInside)
            
           let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.spacing = 50
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(button)
            view.addSubview(stackView)
           
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 50),
                stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                
                stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            ])
            
        }
        
        
        
        override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let simulateData = delegate?.parent.simulatedData else {
                print("Simulated data not provided")
                return
            }
            delegate?.found(code: simulateData)
        }
        @objc func openGallay(_ sender: UIButton) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate  = self
            self.present(imagePicker, animated: true, completion: nil)
            
            
            
        }
        
        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let qrcodeImg = info[.originalImage] as?  UIImage  {
                
                let dectore:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode , context: nil, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])!
                let ciImage:CIImage=CIImage(image: qrcodeImg)!
                var  qrCodeLink=""
                
                let features=dectore.features(in: ciImage)
                for feature in features as! [CIQRCodeFeature] {
                    
                    qrCodeLink += feature.messageString!
                }
                if qrCodeLink=="" {
                    
                    delegate?.didFail(reason: .badOutput)
                    
                    
                }
                else {
                    delegate?.found(code: qrCodeLink)
                    
                }
              
            }
            else {
                
                print("somethng went wrong")
            }
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
        
        
        
        
    }
    #else
    
    
    #endif
    
    
    
    public init(codeTypes: [AVMetadataObject.ObjectType], scanMode: ScanMode = .once, showViewfinder: Bool = false, scanInterval: Double = 2.0, simulatedData:String = "", completion: @escaping (Result<String, ScanError>) -> Void) {
        
        self.codeTypes = codeTypes
        self.scanMode = scanMode
        self.showViewfinder = showViewfinder
        self.scanInterval = scanInterval
        self.simulatedData = simulatedData
        self.completion = completion
      
    }
    public func makeCoordinator() -> ScannerCoordinator {
        return ScannerCoordinator(parent: self)
    }
    
    public func makeUIViewController(context: Context) -> ScannerViewController {
        let viewController = ScannerViewController(showViewfinder: showViewfinder)
        viewController.delegate = context.coordinator
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        
        
    }
    
    
    
}



struct BarCodeScanView_Previews: PreviewProvider {
    static var previews: some View {
        CodeScannerView(codeTypes: [.qr]) { result in
            
            
        }
    }
}
