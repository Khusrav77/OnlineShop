//
//  DeletButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/22/24.
//

import SwiftUI

struct DeleteButton: View {
    // MARK: - Properties
    let name: String
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        
        Button {
           action()
        }label: {
            Image(systemName: name)
                .font(.title3)
                .foregroundStyle(.gray)
                .padding(6)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 8)
               
            
        }
        
    }
}

#Preview {
    DeleteButton(name: "xmark", action: {})
}
