//
//  NewsAPIResponce.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 26.05.2022.
//

import Foundation
import SwiftUI

//MARK: - News Model

struct NewsAPIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    var imageURL: URL? {
        if urlToImage != nil {
            return URL(string: urlToImage!)
        } else {
            return nil
        }
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
