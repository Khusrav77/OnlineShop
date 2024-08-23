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
                .foregroundStyle(.black.opacity(0.8))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.yellow.opacity(0.6))
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.1), radius: 8)
            
            
        }
    }
}

#Preview {
    CustomMainButton(title: "add to cart", action: {})
}
