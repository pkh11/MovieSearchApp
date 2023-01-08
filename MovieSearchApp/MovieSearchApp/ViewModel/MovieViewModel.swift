//
//  ViewModel.swift
//  MovieSearchApp
//
//  Created by Kyoon Ho Park on 2023/01/08.
//

import SwiftUI

final class MovieViewModel: ObservableObject {
    @Published var movieList: [Movie] = []
    private var networkWorker: NetworkWorker = NetworkWorker()
    
    init() {}
    
    internal func fetchMovieList(query: String, page: Int) {
        guard !query.isEmpty else { return }
        networkWorker.movieList(query: query, page: page) { [weak self] movies in
            DispatchQueue.main.async {
                self?.movieList = movies
            }
        }
    }
}
