//
//  CustomMainButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/21/24.
//

import SwiftUI

struct CustomMainButton: View {
    // MARK: - Properties
    let title: String
    let action: () -> ()
    
    // MARK: - Body
    var body: some View {
        
        Button {
           action()
        }label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundStyle(.black.opacity(0.7))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
        }
    }
}

#Preview {
    CustomMainButton(title: "add to cart", action: {})
}
