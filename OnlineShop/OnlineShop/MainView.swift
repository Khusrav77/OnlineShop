//
//  ContentView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/6/24.
//square.grid.2x2

import SwiftUI
import FirebaseFirestore

struct MainView: View {
    
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "Shop") 
    var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCardView(product: item)
                    }
                }
            }
            // MARK: - Navigation Bar
            .navigationTitle("Products")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                    Image(systemName: "square.grid.2x2.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
    }
}

#Preview {
    
    MainView()
}
