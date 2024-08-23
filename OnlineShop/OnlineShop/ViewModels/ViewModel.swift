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
    @Published var cartItems: [Product] = []
    
    var cartItemCount: Int {
        cartItems.filter{ $0.quantityinCart ?? 0 > 0 }.count
    }
   
    var totalPrice: Int {
        cartItems.reduce(0) { $0 + ($1.price * ($1.quantityinCart ?? 0))}
    }
    
    // MARK: - Initializer
    init() {
        fetchItems()
    }
    
    // MARK: - Methods
    private func fetchItems() {
        db.addSnapshotListener { snapahot, error in
            guard let document = snapahot?.documents else {
                print("Error fertching documents: \(error!)")
                return
            }
            
            self.cartItems = document.compactMap { document -> Product? in
                try? document.data(as: Product.self)
            }
        }
    }
    
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
    
    func decreaseQuantityZero(product:Product) {
        let currentQuantity = product.quantityinCart ?? 0
        let newQuantity = max(currentQuantity - 1, 0)
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
