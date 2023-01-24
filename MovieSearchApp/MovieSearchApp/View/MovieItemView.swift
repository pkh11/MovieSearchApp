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
            AsyncImage(url: URL(string: movie.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 60, height: 80)
            } placeholder: {
                Text("No Image")
            }
            .padding(5)
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.title)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    })
                }
                Text("감독: \(movie.director)")
                    .lineLimit(1)
                Text("출연: \(movie.actor)")
                    .lineLimit(1)
                Text("평점: \(movie.userRating)")
                    .lineLimit(1)
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

