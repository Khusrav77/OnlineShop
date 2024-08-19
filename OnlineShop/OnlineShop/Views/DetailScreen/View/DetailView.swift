//
//  DetailView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/19/24.
//

import SwiftUI

struct DetailView: View {
    let product: Product
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 3, y: 5)
               
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 250, height: 280)
                        .padding(.top, 50)
                    
                }
            }
                
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    
                    Text("4.8")
                        .subtitle()
                        
                   
                    Spacer()
                    
                    Text("-25%")
                        .titleFont()
                        .foregroundStyle(.red)
                }
                HStack {
                    Text(product.name)
                        .titleFont()
                        
                   
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("1000")
                            .subtitle()
                            .strikethrough()
                            .foregroundStyle(.gray)
                       
                        HStack {
                            Text("\(product.price)")
                                .titleFont()
                           
                            
                            Text("₽/кг")
                                .titleFont()
                        }
                    }
                }
                
                HStack {
                    Text("Описание")
                        .titleFont()
                }
                
                Text("\(product.discription)")
                    .subtitle()
                HStack {
                    Text("Страна поизводитель:")
                        .titleFont()
                    Spacer()
                    Text("Франция")
                        .subtitle()
                    
                    Image("france")
                }
                Spacer()
                
                Button {
                    
                }label: {
                    Text("Add to cart")
                        .fontWeight(.bold)
                        .foregroundStyle(.black.opacity(0.7))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailView(product: Product(
        name: "Энергетик",
        discription: "jfjnbnkirebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f2jfndkjnvj",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false))
}
