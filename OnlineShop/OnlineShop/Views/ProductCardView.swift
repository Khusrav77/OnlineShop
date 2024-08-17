//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/14/24.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Properties
    let product: Product
    
    // MARK: - Body
    var body: some View {
        
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .topTrailing) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: size.width, height: size.height)
                    
                    // MARK: Button
                    Button {
                        // action
                    } label: {
                        Image(systemName: "heart.circle.fill")
                            .foregroundStyle(product.isFavorite ? .red : .white)
                            .background(.black)
                    }
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .background(.background.opacity(0.5))
        .padding(10)
    }
}
#Preview {
    ProductCardView(product: Product(
        name: "gg",
        discription: "ff",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false
    ))
}
