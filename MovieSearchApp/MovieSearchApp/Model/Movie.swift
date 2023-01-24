//
//  EventModel.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/05.
//

import Foundation

struct Movie: Codable, Identifiable {
    let title: String
    let link: String
    let image: String
    let subTitle: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String
    
    // 네이버 영화검색 오픈 API에서 id값이 없어서 임시로 구현
    // id = "code"
    var id: String { link.components(separatedBy: "=").last ?? "" }
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case image
        case subTitle = "subtitle"
        case pubDate
        case director
        case actor
        case userRating
    }
    
    static let test = Movie(title: "래빗 아카데미: 미션! 부활절달걀 수호대",
                            link: "https://movie.naver.com/movie/bi/mi/basic.nhn?code=218798",
                            imageUrl: "https://ssl.pstatic.net/imgmovie/mdi/mit110/2187/218798_P01_160725.png",
                            subTitle: "Rabbit Academy: <b>Mission</b> Eggpossible",
                            pubDate: "2022",
                            director: "우테 폰 뮌쇼폴|",
                            actor: "",
                            userRating: "0.00")
}
