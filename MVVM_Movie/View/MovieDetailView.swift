//
//  MovieDetailView.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var movieDetailVM: MovieDetailViewModel = MovieDetailViewModel()
    var movieID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                AsyncImage(
                    url: URL(string: movieDetailVM.result?.Poster ?? "")) { image in
                        image.resizable()
                            .frame(height: 400)
                            .cornerRadius(10)
                    } placeholder: {
                        Image("placeholder")
                    }
                
                Text(movieDetailVM.result?.Title ?? "No Name")
                    .font(.largeTitle)
                
                Text(movieDetailVM.result?.Plot ?? "No Description")
                
                Text("Director")
                    .fontWeight(.bold)
                    .padding(.vertical, 5)
                
                Text(movieDetailVM.result?.Director ?? "")
                
                RatingVIew(rating: .constant(movieDetailVM.result?.rating))
                
            }
        }
        .padding()
        .onAppear {
            movieDetailVM.fetchData(movieID: movieID)
        }
        .navigationTitle(movieDetailVM.result?.Title ?? "")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieID: Movie.placeHolder().id)
    }
}
