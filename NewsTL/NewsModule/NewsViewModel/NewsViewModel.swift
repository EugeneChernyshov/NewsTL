//
//  NewsViewModel.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 26.05.2022.
//

import Foundation
import SwiftUI



class NewsViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    @Published var isLoading = false
    
    private let service = NewsService()
    
    init() {
        loadArticles()
    }
    
    func loadArticles() {
        
        isLoading = true
        
        service.getArticles { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let articles):
                    self?.articles = articles
                }
            }
        }
    }
}
