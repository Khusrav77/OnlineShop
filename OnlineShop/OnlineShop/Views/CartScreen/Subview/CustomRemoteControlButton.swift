//
//  CustomRemoteControlButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/21/24.
//

import SwiftUI

struct CustomRemoteControlButton: View {
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
            
        }
    }
}

#Preview {
    CustomRemoteControlButton(name: "xmark", action: {})
}
