//
//  MovieSearchApp.swift
//  MovieSearchApp
//
//  Created by Kyoon Ho Park on 2023/01/04.
//

import SwiftUI

@main
struct MovieSearchApp: App {
    let networkWorker: NetworkWorker = NetworkWorker()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
