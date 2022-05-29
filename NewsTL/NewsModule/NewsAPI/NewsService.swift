//
//  NewsService.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 26.05.2022.
//

import Foundation


#warning("Need to refactoring to better endpoint manager and better API universal functions (like generic) in future")

class NewsService {
    
    func getArticles(_ completion: @escaping (Result<[Article], Error>) -> ()) {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ua&apiKey=84282d1ee65f44a187834d3c4b43d647")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            }
            
            do {
                let response = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
