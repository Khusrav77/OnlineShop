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
   // @State private var counter = 0
    
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
                                    .foregroundStyle(product.isFavorite ? .red.opacity(0.8) : .white.opacity(0.6))
                                    
                                    Spacer()
                                }
                                .padding(.trailing,8)
                                .padding(.top,6)
                            }
                            
                            // is Raiting
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
                    
                // Product Information
                VStack(alignment: .leading) {
                    // Product Name
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
                        
                    }
                    .padding(.horizontal,10)
                    
                    ZStack(alignment: .bottomTrailing){
                        HStack{
                            VStack(alignment: .leading){
                                HStack {
                                    // Price
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
                               
                            }
                            Spacer()
                            
                        }
                        .padding(.horizontal, 10)
                        .padding(.bottom,6)
                        
                        AddToCartButton(product: product)
                            .padding(6)
                    }
                    .frame(height: 50)
                    
                    
                    
                }
                .frame(width: size.width, height: size.height * 0.4)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .black.opacity(0.1), radius: 8)
    }
}
#Preview {
    MainView()
        .environmentObject(ViewModel())
}
