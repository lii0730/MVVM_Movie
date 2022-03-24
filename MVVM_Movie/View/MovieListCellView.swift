//
//  MovieListCellView.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/23.
//

import SwiftUI

struct MovieListCellView: View {
    
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                image.resizable().cornerRadius(20)
            } placeholder: {
                Image("placeholder")
            }.frame(width: 100, height: 100)

            Spacer().frame(width: 30)
                
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
        }
        .padding()
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCellView(movie: Movie.placeHolder())
    }
}
