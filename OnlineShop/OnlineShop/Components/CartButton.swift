import SwiftUI


struct CartButton: View {
    @Binding var counter: Int
    var pricePerUnit: Double
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            if isExpanded {
                HStack(spacing: 8) {
                    
                    // Кнопка уменьшения
                    Button(action: {
                        if counter > 0 {
                            counter -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .padding(6)
                    Spacer()
                    // Количество и цена
                    VStack(spacing: 4) {
                        Text("\(counter) шт")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text("\(String(format: "%.2f", Double(counter) * pricePerUnit)) ₽")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    Spacer()
                    // Кнопка увеличения
                    Button(action: {
                        counter += 1
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                    }
                    .padding(6)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 36)
                .padding(.horizontal, 12)
                .background(Color.green)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.green.opacity(0.1)))
                .shadow(color: .black.opacity(0.1), radius: 5)
                .onTapGesture {
                    // Сворачиваем кнопку по нажатию
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            } else {
                // Сжатое состояние - только иконка корзины
                Button {
                    // Разворачиваем кнопку по нажатию
                    withAnimation {
                        isExpanded.toggle()
                    }
                } label: {
                    Image("cart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
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
struct CartButton_Previews: PreviewProvider {
    @State static var counter = 0 // Создаем переменную для привязки

    static var previews: some View {
        CartButton(counter: $counter, pricePerUnit: 99)
    }
}
