//
//  RemoteControlRowView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/20/24.
//

import SwiftUI

struct RemoteControlRowView: View {
    
    // MARK: - Properties
    let product: Product
    @EnvironmentObject var vm: ViewModel
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 20) {
            // removeFromCart
            Button {
                vm.removeFromCart(product: product)
            }label: {
                Image(systemName: "xmark")
                    .font(.title3)
                    .foregroundStyle(.gray)
                
            }
            
            HStack (spacing: 20){
                // decreaseQuantity
                Button {
                    vm.decreaseQuantity(product: product)
                }label: {
                    Image(systemName: "minus")
                        .font(.title3)
                        .foregroundStyle(.black.opacity(0.8))
                }
                .padding(8)
                
                if let quantityinCart = product.quantityinCart {
                    Text("\(quantityinCart)")
                        .titleFont()
                }
                // increaseQuantity
                Button {
                    vm.increaseQuantity(product: product)
                }label: {
                    Image(systemName: "plus")
                        .font(.title3)
                        .foregroundStyle(.black.opacity(0.8))
                }
                .padding(8)
            }
            .background(.gray.opacity(0.1))
            .clipShape(Capsule())
        }
        .padding()
    }
}

#Preview {
    RemoteControlRowView(product: Product(
        name: "Энергетик",
        discription: "jfjnbnkirebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f2jfndkjnvj",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false, quantityinCart: 4))
}
