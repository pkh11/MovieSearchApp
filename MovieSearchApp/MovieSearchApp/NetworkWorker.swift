//
//  NetworkWorker.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/05.
//

import SwiftUI

final class NetworkWorker {
    private let session: URLSession
    
    // cliendID: wk1lMx3Dh05Kai2hHrac
    // secretKey: a02kdcOh7W
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    internal func movieList(query: String, page: Int, completion: @escaping ([Movie]) -> Void) {
        // url component 생성
        var urlComponents = URLComponents(string: "https://openapi.naver.com/v1/search/movie.json")
        
        // query items
        let query = URLQueryItem(name: "query", value: query)
        let start = URLQueryItem(name: "start", value: "\(page)")
        urlComponents?.queryItems = [query, start]
        
        guard let url = urlComponents?.url else { return }
        
        // request 생성
        var request = URLRequest(url: url)
        request.setValue("wk1lMx3Dh05Kai2hHrac", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("a02kdcOh7W", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        // dataTask로 요청
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse else { return }
            
            do {
                let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(responseModel.items)
            } catch {
                fatalError("Error")
            }
        }.resume()
        // TODO: resume을 해야하는 이유
    }
}

struct ResponseModel: Codable {
    var lastBuildDate: String
    var total: Int
    var start: Int
    var display: Int
    var items: [Movie]
}
