//
//  ProductRow.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/20/24.
//

import SwiftUI

struct ProductRowView: View {
    
    // MARK: - Properties
    let product: Product
    
    // MARK: - Body
    var body: some View {
        
        ZStack (alignment: .trailing) {
            
            HStack(spacing: 20) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 80, height: 80)
                        .padding(8)
                        .shadow(color: .black.opacity(0.1), radius: 8)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(product.name)
                        .titleFont()
                    
                    HStack {
                        if let quantityinCart = product.quantityinCart {
                            let sum = quantityinCart * product.price
                            Text("\(sum) ₽/кг")
                                .titleFont()
                        }
                       
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .background(.gray.opacity(0.1))
                    .clipShape(Capsule())
                }
                Spacer()
            }
            
            RemoteControlRowView(product: product)
            
        }
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .black.opacity(0.1), radius: 8)
        
    }
}

#Preview {
    ProductRowView(product: Product(
        name: "Энергетик",
        discription: "jfjnbnkirebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f2jfndkjnvj",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false, 
        quantityinCart: 4,
        isNewArrival: ""))
    .environmentObject(ViewModel())
}
