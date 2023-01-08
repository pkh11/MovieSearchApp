//
//  ContentView.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieViewModel: MovieViewModel = MovieViewModel()
    @State var keyword: String = "test"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movieViewModel.movieList) { movie in
                    Text(movie.title)
                }
            }
            .navigationTitle("영화검색")
        }
        .searchable(text: $keyword)
        .onAppear(perform: movieViewModel.fetchMovieList)
        .onSubmit {
            movieViewModel.fetchMovieList()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
