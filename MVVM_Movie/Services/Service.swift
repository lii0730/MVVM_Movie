//
//  Service.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/23.
//

import Foundation
import Combine

class Service {
    func getSearchData(search: String) -> AnyPublisher<Search, Error> {
        let url = Constants.REQUEST_URL + "&s=\(search)"
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Search.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getMovieDetail(id: String) -> AnyPublisher<Detail, Error> {
        let url = Constants.REQUEST_URL + "&i=\(id)"
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Detail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
