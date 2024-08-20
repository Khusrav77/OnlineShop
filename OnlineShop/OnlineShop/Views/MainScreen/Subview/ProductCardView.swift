//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/14/24.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Properties
    @EnvironmentObject var vm: ViewModel
    let product: Product
    @State private var counter = 0
    
    // MARK: - Body
    var body: some View {
        
        GeometryReader { geo in
            let size = geo.size
            
            VStack(alignment: .leading) {
                
                ZStack(alignment: .top) {
                        if let url = URL(string: product.image) {
                            CardImageView(url: url, width: size.width, height: size.height * 0.5)
                                .padding(.top,8)
                            
                            // New or Sale
                            HStack{
                                VStack {
                                    Text("новинка")
                                        .font(.system(size: 12))
                                        .foregroundStyle(.white)
                                        .padding(.vertical, 2)
                                        .padding(.trailing, 6)
                                        .padding(.leading, 8)
                                        .background(.purple.opacity(0.8))
                                        .clipShape(.rect(cornerRadius: 6))
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                // MARK: Button is favorite
                                VStack {
                                    isFavoriteButton {
                                        vm.toglleFavorite(product: product)
                                        
                                    }
                                    .foregroundStyle(product.isFavorite ? .red : .white)
 
                                    
                                    Spacer()
                                }
                                .padding(.trailing,8)
                                .padding(.top,6)
                            }
                            
                            // is Favorite
                            VStack{
                                Spacer()
                                // Raiting
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                    
                                    Text("4.8")
                                        .subtitle()
                                        .foregroundStyle(.black)
                                    Spacer()
                                    
                                    // Sale
                                    Text("-25%")
                                        .titleFont()
                                        .foregroundStyle(.red)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                .frame(width: size.width, height: size.height * 0.6)
                    
                // Product information
                ZStack(alignment: .bottomTrailing) {
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .titleFont()
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.black)
                            .lineLimit(2)
                       
                        // Country
                        HStack {
                            Text("Франция")
                                .subtitle()
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                            
                            Image("france")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 15, height: 14)
                        }
                        
                        Spacer()
                        // Price
                        HStack {
                            Text("\(product.price)")
                                .titleFont()
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text("₽/кг")
                                .subtitle()
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                        }
                        
                        Text("1000")
                            .subtitle()
                            .strikethrough()
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                    }
                    .padding(.horizontal, 8)
                    VStack(alignment: .trailing){
                        Spacer()
                        CartButton(counter: $counter, pricePerUnit: Double(product.price))
                            .padding(6)
                            .padding(.bottom,6)
                    }
                    
                }
                .frame(width: size.width, height: size.height * 0.4)
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
        .environmentObject(ViewModel())
}
