//
//  Product.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/6/24.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Codable {
    
    @DocumentID var id: String?
    var name: String
    var discription: String
    var image: String
    var price: Int
    var isFavorite: Bool
    var quantityinCart: Int?
    var isNewArrival: String
}
