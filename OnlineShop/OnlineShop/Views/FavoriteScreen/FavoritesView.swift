//
//  FavoritesView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/14/24.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct FavoritesView: View {
    
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "Shop", predicates: [.isEqualTo("isFavorite", true)])
    private var favoritesItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoritesItems) { item in
                    NavigationLink(destination: DetailView(product: item)) {
                        ProductCardView(product: item)
                    }
                    //.buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 8)
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
}
