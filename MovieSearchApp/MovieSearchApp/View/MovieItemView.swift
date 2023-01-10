//
//  MovieItemView.swift
//  MovieSearchApp
//
//  Created by Kyoon Ho Park on 2023/01/10.
//

import SwiftUI

struct MovieItemView: View {
    var movie: Movie
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(movie.title)
                    Button(action: {}, label: {
                        Image(systemName: "star.fill")
                    })
                }
                Text("감독: \(movie.director)")
                Text("출연: \(movie.actor)")
                Text("평점: \(movie.userRating)")
            }
        }
    }
}
//
//struct MovieItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieItemView(movie: Movie())
//    }
//}

