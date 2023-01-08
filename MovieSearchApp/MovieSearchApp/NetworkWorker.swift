//
//  NetworkWorker.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/05.
//

import Foundation

final class NetworkWorker {
    private let session: URLSession
    
    // cliendID: wk1lMx3Dh05Kai2hHrac
    // secretKey: a02kdcOh7W
    
    init(session: URLSession = .shared) {
        self.session = session
        eventList()
    }
    
    internal func eventList() {
        // url component 생성
        var urlComponents = URLComponents(string: "https://openapi.naver.com/v1/search/movie.json")
        
        // query items
        let query = URLQueryItem(name: "query", value: "mission")
        let start = URLQueryItem(name: "start", value: "1")
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
                print(responseModel)
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
