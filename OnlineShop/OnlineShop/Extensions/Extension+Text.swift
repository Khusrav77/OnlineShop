//
//  Extension+Text.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/18/24.
//

import SwiftUI

extension Text {
    func titleFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 16,weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func subtitle() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 14, weight: .regular, design: .rounded))
            .opacity(0.8)
    }
}

struct FontView: View {
    var body: some View {
        
        Text("Title Font")
            .titleFont()
        
        Text("Subtitle Font")
            .subtitle()
    }
}

#Preview {
    FontView()
}
