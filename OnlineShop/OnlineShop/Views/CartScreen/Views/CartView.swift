//
//  CartView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/14/24.
//

import SwiftUI
import FirebaseFirestore

struct CartView: View {
    // MARK: - Properties
   // let product: Product
    @FirestoreQuery(collectionPath: "Shop") private var items: [Product]
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                ForEach(items.filter { $0.quantityinCart ?? 0 > 0 }) { item in
                    ProductRowView(product: item)
                        .padding(.horizontal,10)
                }
            }
            
            HStack {
                Text("Итого:")
                    .titleFont()
                
                Text("")
            }
            
            Spacer()
            
            CustomMainButton(title: "Оформить заказ") {}
                .padding()
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    CartView()
}
