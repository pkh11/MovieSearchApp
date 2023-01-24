//
//  ContentView.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieViewModel: MovieViewModel = MovieViewModel()
    @State private var keyword: String = ""
    @State private var isSearching: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isSearching {
                    List {
                        ForEach(movieViewModel.movieList) { movie in
                            MovieItemView(movie: movie)
                                .onAppear {
                                    if self.movieViewModel.movieList.last == movie {
                                        print("마지막")
                                    }
                                }
                        }
                    }
                } else {
                    Text("데이터 없음")
                }
            }
            .navigationTitle("영화검색")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button("Add") {}
            }
            .searchable(text: $keyword, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: keyword) { newValue in
                print("\(newValue)")
                isSearching = true
                movieViewModel.fetchMovieList(query: newValue, page: 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
