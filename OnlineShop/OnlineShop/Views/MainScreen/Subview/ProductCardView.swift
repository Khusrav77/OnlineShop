//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/14/24.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Properties
    let product: Product
    @State private var counter = 0
    
    // MARK: - Body
    var body: some View {
        
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .bottomTrailing) {
               
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .topTrailing) {
                        if let url = URL(string: product.image) {
                            CardImageView(url: url, width: size.width, height: size.height * 0.5)
                            //
                            HStack {
                                Text("новинка")
                                    .font(.system(size: 12))
                                    .padding(.horizontal,6)
                                    .background(.purple.opacity(0.8))
                                    .clipShape(.rect(cornerRadius: 6))
                                
                                Spacer()
                                
                                // MARK: Button is favorite
                                Button {
                                    // action
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .padding(6)
                                        .foregroundStyle(product.isFavorite ? .red : .gray.opacity(0.2))
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 1)
                                        
                                }
                                .padding(.trailing,6)
                                .padding(.top,6)
                            }
                        }
                    }
                    
                    // Raiting
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        
                        Text("4.8")
                            .subtitle()
                        
                        Spacer()
                        
                        // Sale
                        Text("-25%")
                            .titleFont()
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, 6)
                    .padding(.bottom,2)
                    
                    // Product information
                    Text(product.name)
                        .titleFont()
                        .lineLimit(2)
                        .padding(.leading, 6)
                    // Country
                    HStack {
                        Text("Франция")
                            .subtitle()
                            
                            .padding(.horizontal,6)
                        
                        Image("france")
                    }
                    
                    Spacer()
                    // Price
                    HStack {
                        Text("\(product.price)")
                            .titleFont()
                        .padding(.leading, 6)
                        
                        Text("₽/кг")
                            .subtitle()
                    }
                    
                    Text("1000")
                        .subtitle()
                        .strikethrough()
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 6)
                        .padding(.bottom, 4)
                    
                }
           
               CartButton(counter: $counter, pricePerUnit: 99)
                    .padding(.horizontal,4)
                    .padding(.bottom,4)
                   
            }
            
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.2)))
        .shadow(color: .black.opacity(0.1), radius: 8)
    }
}
#Preview {
    MainView()
}
