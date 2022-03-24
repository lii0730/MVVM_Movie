//
//  MovieDetailViewModel.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/24.
//

import Foundation
import SwiftUI
import Combine

class MovieDetailViewModel: ObservableObject {
    
    @Published var result: Detail?
    
    private var store = Set<AnyCancellable>()
    
    func fetchData(movieID: String) {
        Service().getMovieDetail(id: movieID)
            .sink(receiveCompletion: { _ in }) { [weak self] receivedResult in
                self?.result = receivedResult
            }
            .store(in: &store)
    }
}
