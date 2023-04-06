//
//  APICaller.swift
//  Netflix
//
//  Created by Thiago Pereira on 06/04/23.
//

import Foundation

struct Constants {
    static let API_KEY = "3f6b70980861b7fab476f78772e7e4d2"
    static let baseURL = "https://api.themoviedb.org"
}

enum APITError: Error {
    case failedToGetData
}


class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                //print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
