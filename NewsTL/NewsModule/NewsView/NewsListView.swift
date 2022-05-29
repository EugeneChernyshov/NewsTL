//
//  NewsListView.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 25.05.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        if viewModel.isLoading {
            return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
        } else {
            return AnyView(
                VStack{
                    SearchBar(text: $searchText).padding(.top, 10)
                    List(self.viewModel.articles.filter({ searchText.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(searchText) })) { article in
                    ArticleListCell(
                        title: article.title,
                        source: article.source.name,
                        publishedDate: article.publishedAt.formatJSStringToDisplayingDate(),
                        previewText: article.description ?? "",
                        imageURL: article.urlToImage,
                        urlToNavigate: article.url)
                }.listStyle(GroupedListStyle())
                }
            )
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
