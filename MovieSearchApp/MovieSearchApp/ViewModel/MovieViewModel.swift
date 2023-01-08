//
//  ViewModel.swift
//  MovieSearchApp
//
//  Created by Kyoon Ho Park on 2023/01/08.
//

import Foundation

final class MovieViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    private var networkWorker: NetworkWorker = NetworkWorker()
    
    init() {
        self.fetchMovieList()
    }
    
    internal func fetchMovieList() {
        networkWorker.movieList { [weak self] movies in
            self?.movieList = movies
        }
    }
}
