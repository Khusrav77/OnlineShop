//
//  ConfirmOrderButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/22/24.
//

import SwiftUI

struct ConfirmOrderButton: View {
    
    // MARK: - Properties
    let count: String
    let total: String
    
    // MARK: - Body
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()
            HStack {
                Text(count)
                    .titleFont()
                    .foregroundStyle(.black.opacity(0.8))
                
                Text(total)
                    .titleFont()
                    .foregroundStyle(.black.opacity(0.8))
                
            }
            .padding(.horizontal,8)
            .padding(.vertical,6)
            .background(.white.opacity(0.9))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.1), radius: 8)
            
            CustomMainButton(title: "Оформить заказ") {}
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width, height: 80)
        
        
    }
}

#Preview {
    ConfirmOrderButton(count: "товаров на сумму:", total: "  ₽.")
        
}
