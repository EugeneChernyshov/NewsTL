//
//  ArticleDetailsView.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 28.05.2022.
//

import Foundation
import SwiftUI

struct ArticleDetailsView: View {

    @Environment(\.presentationMode) var presentationMode
    
    @State var urlString = ""
    @State var workState = WebView.WorkState.initial

var body: some View {
    Button {
        presentationMode.wrappedValue.dismiss()
    } label: {
        HStack {
            Image(systemName: "chevron.left")
            Text("Назад")
        }
    }.frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 40,
        alignment: .topLeading)
    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
    WebView(urlString: self.$urlString, workState: self.$workState)
}
    
}

