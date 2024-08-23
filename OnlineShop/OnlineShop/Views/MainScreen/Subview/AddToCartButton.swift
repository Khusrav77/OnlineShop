import SwiftUI


struct AddToCartButton: View {
    let product: Product
    @EnvironmentObject var vm: ViewModel
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            if isExpanded {
                HStack(spacing: 8) {
                    // decreaseQuantity
                    CustomRegulatorButton(name: "minus") {
                        product.quantityinCart == 0 ? isExpanded.toggle() :
                        vm.decreaseQuantityZero(product: product)
                        
                        
                    }
                
                    Spacer()
                    
                    // Количество и цена
                    VStack(spacing: 4) {
                        
                        if let quantityinCart = product.quantityinCart {
                            Text("\(quantityinCart)")
                                .titleFont()
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        if let quantityinCart = product.quantityinCart {
                            let sum = quantityinCart * product.price
                            Text("\(sum) ₽")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    
                    Spacer()
                    
                    // increaseQuantity
                    CustomRegulatorButton(name: "plus") {
                        vm.increaseQuantity(product: product)
                    }
                   // .padding(6)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 36)
                .padding(.horizontal, 12)
                .background(Color.green)
                .clipShape(Capsule())
                
            } else {
                // Сжатое состояние - только иконка корзины
                CustomRegulatorButton(name: "basket") {
                    withAnimation {
                        vm.increaseQuantity(product: product)
                        isExpanded.toggle()
                            
                    }
                }
                .frame(width: 50, height: 36)
                .background(Color.green)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.gray.opacity(0.1)))
                .shadow(color: .black.opacity(0.1), radius: 5)
            }
        }
    }
}
#Preview {
    AddToCartButton(product: Product(
        name: "Энергетик",
        discription: "jfjnbnkirebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f2jfndkjnvj",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-89822.appspot.com/o/1.jpg?alt=media&token=a05d20f7-6ece-4271-82c0-f3f1bf552f22",
        price: 99,
        isFavorite: false, 
        quantityinCart: 4,
        isNewArrival: ""))
    .environmentObject(ViewModel())
}
