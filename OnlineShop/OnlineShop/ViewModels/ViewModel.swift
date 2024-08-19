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
    private var db = Firestore.firestore().collection("shop")
    
    // MARK: - Methods
    func toglleFavorite(product: Product) {
        guard let id = product.id else {return}
        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
}
