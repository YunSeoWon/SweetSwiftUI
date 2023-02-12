//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/25.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI
import Foundation

struct ProductDetailView: View {
    let product: Product
    
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @State private var showingPopup: Bool = false
    @EnvironmentObject private var orderViewModel: OrderViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .popup(isPresented: $showingPopup, style: .dimmed) {
            OrderCompletedMessage()
        }
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: $showingAlert) {
            confirmAlert
        }
    }
    
    var productImage: some View {
        GeometryReader { _ in
            ResizedImage(product.imageName)
        }
    }
    
    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                
                self.productionDescription
                
                Spacer()
                
                self.priceInfo
                
                self.placeOrderButton
            }
            .padding(32)
            .frame(height: $0.size.height)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productionDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                FavoriteButton(product: product)
            }
            
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        
        return HStack {
            (Text("₩")
             + Text("\(price)").font(.title)
            ).fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }.foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: { self.showingAlert = true }) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(Text("주문하기"))
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                .padding(.vertical, 8)
        }
        .buttonStyle(ShrinkButtonStyle())
    }
    
    var confirmAlert: Alert {
        Alert(
            title: Text("주문 확인"),
            message: Text("\(product.name)을(를) \(quantity)개 구매하겠습니까?"),
            primaryButton: .default(Text("확인"), action: {
                self.placeOrder()
            }),
            secondaryButton: .cancel(Text("취소"))
        )
    }
    
    private func placeOrder() {
        orderViewModel.order(product: product, quantity: quantity)
        showingPopup = true
    }
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        
        let centerIndex = text.index(text.startIndex, offsetBy: text.count / 2)
        
        let centerSpaceIndex = text[..<centerIndex].lastIndex(of: " ")
        ?? text[centerIndex...].firstIndex(of: " ")
        ?? text.index(before: text.endIndex)
        
        let afterSpaceIndex = text.index(after: centerSpaceIndex)
        
        let lhsString = text[..<afterSpaceIndex].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIndex...].trimmingCharacters(in: .whitespaces)
        
        return String(lhsString + "\n" + rhsString)
    }
}


struct ProductDetailView_Preview: PreviewProvider {
    static var previews: some View {
        let source1 = ProductDetailView(product: productSamples[0])
        let source2 = ProductDetailView(product: productSamples[1])
        
        return Group {
            Preview(source: source1)
            Preview(source: source2, devices: [.iPhone11Pro], displayDarkMode: false)
        }
    }
}
