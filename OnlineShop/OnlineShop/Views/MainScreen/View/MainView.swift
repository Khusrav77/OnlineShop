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
    @EnvironmentObject var vm: ViewModel
    @FirestoreQuery(collectionPath: "Shop") private var items: [Product]
    
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
               
                
                // MARK: - Navigation Bar
                .navigationTitle("Products")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundStyle(.green)
                        }
                        .buttonStyle(.plain)
                    }
                   
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "heart")
                                .font(.title2)
                                .foregroundStyle(.green)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: CartView()) {
                            Image(systemName: "cart")
                                .font(.title2)
                                .foregroundStyle(.green)
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
            }
            .padding(.horizontal,8)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
