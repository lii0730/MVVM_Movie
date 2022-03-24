//
//  Movie.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/23.
//

import Foundation

struct Search: Codable {
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let id: String
    let type: String
    let posterUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case id = "imdbID"
        case type = "Type"
        case posterUrl = "Poster"
    }
    
    static func placeHolder() -> Movie {
        return Movie(title: "Batman Begins", year: "2005", id: "tt0372784", type: "movie", posterUrl: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg")
    }
}

struct Detail: Codable {
    let Title: String
    let Plot: String
    let Director: String
    let Poster: String
    let imdbRating: String
    
    var rating: Int {
        let rating = Double(imdbRating)
        return Int(ceil(rating ?? 0.0))
    }
    
    static func placeHolder() -> Detail {
        return Detail(
            Title: "Batman Begins",
            Plot: "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.",
            Director: "Christopher Nolan",
            Poster: "https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
            imdbRating: "8.3"
        )
        
    }
}
