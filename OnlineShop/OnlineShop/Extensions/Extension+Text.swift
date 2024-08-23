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
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    func subtitle() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 12, weight: .regular, design: .rounded))
            .opacity(0.8)
    }
    
    func newBadgeStyle() -> some View {
        self
            .font(.system(size: 12))
            .foregroundStyle(.white)
            .padding(.vertical, 2)
            .padding(.horizontal, 6)
            .background(.purple.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(10)
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
