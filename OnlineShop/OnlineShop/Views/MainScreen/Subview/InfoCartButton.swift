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
                .font(.title2)
                .padding(.top, 5)
                .foregroundStyle(.green)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .frame(width: 17, height: 17)
                    .font(.caption).bold()
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(Circle())
                    
            }
        }
    }
}

#Preview {
    InfoCartButton(numberOfProducts: 3)
}
