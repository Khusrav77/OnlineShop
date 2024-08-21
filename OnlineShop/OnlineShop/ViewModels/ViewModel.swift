//
//  Model.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/18/24.
//

import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject{
    
    // MARK: - Properties
    private var db = Firestore.firestore().collection("Shop")
    
    // MARK: - Methods
    func toglleFavorite(product: Product) {
        updateItem(product, data: ["isFavorite" : !product.isFavorite])
    }
    
    func addToCart(product: Product) {
        updateItem(product, data: ["quantityinCart" : 1])
    }
    
    func removeFromCart(product: Product) {
        updateItem(product, data: ["quantityinCart" : 0])
    }
    
    func increaseQuantity(product: Product) {
        let newQuantity = (product.quantityinCart ?? 0) + 1
        updateItem(product, data: ["quantityinCart" : newQuantity])
    }
    
    func decreaseQuantity(product:Product) {
        let currentQuantity = product.quantityinCart ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        updateItem(product, data: ["quantityinCart" : newQuantity])
    }
    
    private func updateItem(_ product: Product, data: [String: Any]) {
        guard let id = product.id else {return}
        db.document(id).updateData(data)
    }
}
