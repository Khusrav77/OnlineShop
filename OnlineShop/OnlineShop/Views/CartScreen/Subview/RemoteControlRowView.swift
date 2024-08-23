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
            DeleteButton(name: "xmark") {
                vm.removeFromCart(product: product)
            }
            
            HStack (spacing: 20){
                // decreaseQuantity
                CustomRemoteControlButton(name: "minus") {
                    vm.decreaseQuantity(product: product)
                }
                .padding(8)
                
                if let quantityinCart = product.quantityinCart {
                    Text("\(quantityinCart)")
                        .titleFont()
                }
                // increaseQuantity
                CustomRemoteControlButton(name: "plus") {
                    vm.increaseQuantity(product: product)
                }
                .padding(8)
            }
            .background(.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.1), radius: 8)
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
        isFavorite: false, quantityinCart: 4,
        isNewArrival:""))
    
}
