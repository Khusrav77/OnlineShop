//
//  SwiftUIView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/23/24.
//

import SwiftUI

struct ProductListCardView: View {
    
    // MARK: - Properties
        @EnvironmentObject var vm: ViewModel
        let product: Product
        private let screenWidth = UIScreen.main.bounds.width

    // MARK: - Body
        var body: some View {
            VStack(spacing: 0) {
                HStack {
                    productImageView
                        .padding(.leading)
                        
                    VStack {
                        productInfoView
                            .padding(.trailing)
                        Spacer()
                        productPriceView
                            .padding(.trailing)
                    }
                    .frame(width: screenWidth * 0.6, height: screenWidth / 2)
                }
        
                Divider()
            }
            .frame(width: screenWidth, height: screenWidth / 2)
            
        }

        // MARK: - Subviews

        private var productImageView: some View {
            ZStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 144, height: 144)
                }
                VStack {
                    HStack {
                        Text("New")
                            .newBadgeStyle()
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("-25%")
                            .titleFont()
                            .foregroundStyle(.red)
                            .padding(10)
                    }
                }
                .frame(width: screenWidth * 0.4, height: screenWidth / 2)
            }
        }

        private var productInfoView: some View {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("4.8")
                            .subtitle()
                            .foregroundStyle(.black)
                        Rectangle()
                            .frame(width: 1, height: 15)
                            .foregroundStyle(.gray)
                        Text("19 отзывов")
                            .subtitle()
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top, 10)

                    Text(product.name)
                        .titleFont()
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.black)
                        .lineLimit(2)
                    
                    HStack {
                        Text("Франция")
                            .subtitle()
                            .foregroundStyle(.black)
                        Image("france")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 14)
                    }
                }
                isFavoriteButton {
                    vm.toglleFavorite(product: product)
                }
                .foregroundStyle(product.isFavorite ? .red.opacity(0.8) : .white.opacity(0.6))
                .padding(10)
            }
        }

        private var productPriceView: some View {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(product.price)")
                            .titleFont()
                            .foregroundStyle(.black)
                        Text("₽/кг")
                            .subtitle()
                            .foregroundStyle(.black)
                    }
                    Text("1000")
                        .subtitle()
                        .strikethrough()
                        .foregroundStyle(.gray)
                        .padding(.bottom, 10)
                }
                Spacer()
                AddToCartButton(product: product)
                    .padding(.trailing, 10)
                    .padding(.bottom, 10)
            }
        }
    }

    //


#Preview {
    
    ProductListCardView(product: Product(
        name: "Энергетик",
        discription: "jfjnbnkirebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f2jfndkjnvj",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false, quantityinCart: 4,
    isNewArrival: "новинка"))
    
    .environmentObject(ViewModel())
}

