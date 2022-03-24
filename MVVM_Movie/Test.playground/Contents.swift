import UIKit
import Combine


struct Constants {
    static let API_KEY = "3bc40a42"
    static let REQUEST_URL: String = "http://www.omdbapi.com/?apikey=\(API_KEY)"
}

class Service {
    func getSearchData(search: String) -> AnyPublisher<Search, Error> {
        let urlString = Constants.REQUEST_URL + "&s=\(search)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: Search.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

let service = Service()
let publisher = service.getSearchData(search: "batman")

let cancellable = publisher.sink(receiveCompletion: { _ in
    
}, receiveValue: { data in
    print(data.search.first?.title)
})
