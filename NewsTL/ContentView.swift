//
//  ContentView.swift
//  NewsTL
//
//  Created by Evgeniy Chernyshov on 25.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    @State private var searchText = ""
    
    var body: some View {
        Text("Hello!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
