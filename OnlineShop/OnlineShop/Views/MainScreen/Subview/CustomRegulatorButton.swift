//
//  CustomRegulatorButton.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/22/24.
//

import SwiftUI

struct CustomRegulatorButton: View {
    let name: String
    let action: () -> Void
    var body: some View {
        
        Button {
           action()
        }label: {
            Image(systemName: name)
                .font(.title3)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
}

#Preview {
    CustomRegulatorButton(name: "plus", action: {})
}
