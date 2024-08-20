//
//  SwiftUIView.swift
//  OnlineShop
//
//  Created by Khusrav Safiev on 8/19/24.
//

import SwiftUI

struct CartButtonn: View {
    @Binding var counter: Int
    var pricePerUnit: Double
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            if isExpanded {
                HStack(spacing: 16) {
                    Button(action: decrementCounter) {
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    
                    VStack(spacing: 4) {
                        Text("\(counter) шт")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("~\(String(format: "%.2f", Double(counter) * pricePerUnit)) ₽")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Button(action: incrementCounter) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                }
                .frame(height: 36)
                .padding(.horizontal, 12)
                .background(Color.green)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.green.opacity(0.1)))
                .shadow(color: .black.opacity(0.1), radius: 5)
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            } else {
                Button {
                    withAnimation(.spring()) {
                        isExpanded.toggle()
                    }
                } label: {
                    Image("cart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                }
                .frame(width: 40, height: 40)
                .padding(4)
                .background(Color.white)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.gray.opacity(0.1)))
                .shadow(color: .black.opacity(0.1), radius: 5)
            }
        }
    }
    
   

    
    private func incrementCounter() {
        withAnimation(.easeInOut) {
            counter += 1
        }
    }
    
    private func decrementCounter() {
        withAnimation(.easeInOut) {
            if counter > 0 {
                counter -= 1
            }
        }
    }
}

struct CartButtonn_Previews: PreviewProvider {
    @State static var counter = 1 // Создаем переменную для привязки

    static var previews: some View {
        CartButtonn(counter: $counter, pricePerUnit: 99)
    }
}
  

   
