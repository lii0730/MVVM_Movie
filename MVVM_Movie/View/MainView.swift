//
//  MainView.swift
//  MVVM_Movie
//
//  Created by LeeHsss on 2022/03/23.
//

import SwiftUI
import Combine

struct MainView: View {
    
    @ObservedObject var mainVM = MainViewModel()
    @State private var searchData: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchData, onCommit: {
                    mainVM.fetchData(movieName: searchData)
                })
                    .textFieldStyle(.roundedBorder)
                
                List(mainVM.result?.search ?? [], id: \.id) { movie in
                    NavigationLink(destination: {
                        MovieDetailView(movieID: movie.id)
                    }, label: {
                        MovieListCellView(movie: movie)
                    })
                }.listStyle(.inset)
            }
            .navigationTitle("Movies")
        }.padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
