//
//  NetworkWorker.swift
//  EventApp
//
//  Created by Kyoon Ho Park on 2023/01/05.
//

import Foundation

final class NetworkWorker {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    internal func eventList() {
        // url 생성
        guard let url = URL(string: "") else { return }
        
        // request 생성
        let request = URLRequest(url: url)
        
        // dataTast로 요청
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse else { return }
            
        }.resume()
        // TODO: resume을 해야하는 이유
    }
}
