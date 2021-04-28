//
//  LocationService.swift
//  RxswiftApiDemo
//
//  Created by Knoxpo MacBook Pro on 28/04/21.
//

import Foundation
import Combine
import MapKit
import SwiftUI

class LocationService: NSObject, ObservableObject {
    
    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching
        case error(String)
        case result
        
    }
    @Published var queryFragment: String = ""
    @Published private(set) var status: LocationStatus = .idle
    @Published private (set) var searchResults: [MKLocalSearchCompletion] = []
    private var queryCancallable: AnyCancellable?
    private let searchCompleter: MKLocalSearchCompleter!
    
   
    init(searchCompleter: MKLocalSearchCompleter = MKLocalSearchCompleter()) {
        self.searchCompleter = searchCompleter
        super.init()
        self.searchCompleter.delegate = self
        queryCancallable = $queryFragment
            .receive(on: DispatchQueue.main)
            .debounce(for: .milliseconds(250), scheduler: RunLoop.main, options: nil)
            .sink(receiveValue: { fragment in
                self.status = .isSearching
                if !fragment.isEmpty {
                    self.searchCompleter.queryFragment = fragment
                }
                else
                {
                    self.status = .idle
                    self.searchResults = []
                }
                })
             }
      
}


extension LocationService: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.searchResults = completer.results.filter({$0.subtitle == ""})
        self.status = completer.results.isEmpty ? .noResults : .result
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        self.status = .error(error.localizedDescription)
    }
    
}
