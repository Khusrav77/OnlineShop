//
//  CartButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/21/24.
//

import SwiftUI

struct InfoCartButton: View {
   
    // MARK: - Properties
    var numberOfProducts: Int
   
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .frame(width: 40, height: 40)
                .foregroundStyle(.yellow.opacity(0.6))
                .background(.gray.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .frame(width: 17, height: 17)
                    .font(.caption).bold()
                    .foregroundStyle(.white)
                    .background(.green)
                    .clipShape(Circle())
                    
            }
        }
    }
}

#Preview {
    InfoCartButton(numberOfProducts: 3)
}
