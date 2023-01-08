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
}
