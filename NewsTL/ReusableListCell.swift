//
//  ReusableListCell.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 27.05.2022.
//

import Foundation
import SwiftUI

//TODO: - Need to add pagination

struct ArticleListCell: View {
    
    @State var title: String
    @State var source: String
    @State var publishedDate: String
    @State var previewText: String
    @State var imageURL: String?
    @State var urlToNavigate: String
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            if let imageUrl = imageURL {
                CacheAsyncImage(
                    url: URL(string: imageUrl)!
                ) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .frame(maxHeight: 200)
                    case .failure:
                        EmptyView()
                    case .empty:
                        ProgressView()
                    @unknown default:
                        // AsyncImagePhase is not marked as @frozen.
                        // We need to support new cases in the future.
                        EmptyView()
                    }
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0)
            }
            VStack(alignment: .leading) {
                HStack {
                    Image("blueFilledCircle").resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    VStack {
                        HStack{
                            Text(title).lineLimit(2) .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 16, weight: .medium, design: .default))
                            Spacer()
                            Text(publishedDate)
                                .lineLimit(1)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(.system(size: 16, weight: .regular, design: .default))
                        }
                    }
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "chevron.right")
                            .frame(width: 40, height: 40)
                    } .fullScreenCover(isPresented: $showingSheet) {
                       ArticleDetailsView(urlString: urlToNavigate)
                    }.buttonStyle(PlainButtonStyle())
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(source).lineLimit(1).fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14, weight: .medium, design: .default))
                    Text(previewText).multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 14, weight: .regular, design: .default))
                    }
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            alignment: .topLeading)
    }
}

struct ArticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListCell(title: "Title", source: "Source", publishedDate: "Date", previewText: "Preview", imageURL: "https://img.tsn.ua/cached/350/tsn-45ddb1c1da8bc78232f746637fde253d/thumbs/1200x630/8b/c3/48a1587cda0637ee02a7fa6c658fc38b.jpeg", urlToNavigate: "https://tsn.ua/ato/ssha-napravlyat-do-ukrayini-novitni-rszv-zokrema-himars-wsj-2072962.html")
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
        
    }
}

