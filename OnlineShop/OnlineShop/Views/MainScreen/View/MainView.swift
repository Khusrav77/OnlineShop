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
   
    @State private var isTwoColumns = true
    
    var columnsTwo = Array(repeating: GridItem(), count: 2)
    var columns = [GridItem(.flexible())]
   
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: isTwoColumns ? columnsTwo : columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            if isTwoColumns {
                                ProductCardView(product: item)
                            } else {
                                ProductListCardView(product: item)
                            }
                             
                        }
                    }
                }
               
                
                // MARK: - Navigation Bar
                .navigationTitle("Products")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        HomeButton(name: isTwoColumns ?  "grid" : "chips") {
                            isTwoColumns.toggle()
                        }
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: FavoritesView()) {
                            Image(systemName: "heart")
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.red.opacity(0.8))
                                .background(.gray.opacity(0.1))
                                .clipShape(.rect(cornerRadius: 10))
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: CartView()) {
                            InfoCartButton(numberOfProducts: vm.cartItemCount)
                        }
                    }
                }
            }
            .padding(.horizontal, isTwoColumns ? 10 : 0)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
