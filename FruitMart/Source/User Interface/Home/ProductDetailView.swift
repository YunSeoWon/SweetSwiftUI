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
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }.edgesIgnoringSafeArea(.top)
    }
    
    var productImage: some View {
        GeometryReader { _ in
            Image(product.imageName)
                .resizable()
                .scaledToFill()
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
            .frame(height: $0.size.height)
            .padding(32)
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
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(Color.peach)
                    .frame(width: 32, height: 32)
            }
            
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        HStack {
            (Text("₩")
             + Text("\(product.price)").font(.title)
            ).fontWeight(.medium)
            Spacer()
        }.foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: { print("Button") }) {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(Text("주문하기"))
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                .padding(.vertical, 8)
        }
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


