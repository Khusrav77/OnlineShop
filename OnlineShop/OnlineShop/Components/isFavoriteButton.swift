//
//  isFavoriteButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/20/24.
//

import SwiftUI

struct isFavoriteButton: View {
    
    // MARK: - Properties
  
   let toggleAction: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button{
            toggleAction()
        }label: {
            ZStack{
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(.gray)
                    .opacity(0.1)
                Image(systemName: "heart.fill")
                   
            }
            
                
            
        }
    }
}

#Preview {
    isFavoriteButton(toggleAction: {})
}
