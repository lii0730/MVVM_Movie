//
//  MainViewModel.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/23.
//

import Foundation
import SwiftUI
import Combine


class MainViewModel: ObservableObject {
    
    @Published var result: Search?
    private var store = Set<AnyCancellable>()
    
    init() {
        fetchData()
    }
    
    func fetchData(movieName: String = "") {
        
        if movieName.isEmpty {
            return
        }
        
        Service().getSearchData(search: movieName)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] data in
                self?.result = data
            })
            .store(in: &store)
    }
}
