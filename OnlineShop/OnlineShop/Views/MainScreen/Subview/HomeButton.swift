//
//  HomeButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/22/24.
//

import SwiftUI

struct HomeButton: View {
    let name: String
    let action: () -> Void
    
    var body: some View {
            
        Button(action: action) {
            ZStack{
                Image(name)
                    .font(.title3)
                    .foregroundStyle(.green)
            }
            .frame(width: 40, height: 40)
            .background(.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
        }
                
           
                }
}

#Preview {
    HomeButton(name: "square.grid.2x2", action: {})
}
