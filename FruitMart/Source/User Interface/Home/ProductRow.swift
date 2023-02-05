//
//  ProductRow.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/12.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

/**
 * 기본 타입에서는 프로퍼티를 정의하고 뷰 프로토콜의 핵심인 body를 구현하는 작업만 담당,
 * 그 외에는 확장 영역(extension) 으로 명확하게 구분
 */
struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }.frame(height: 130)
            .background(Color.primary.colorInvert())
            .cornerRadius(6)
            .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
            .padding(.vertical, 8)
    }
}

/**
 * 세부 뷰 정의
 */
private extension ProductRow {
    
    var productImage: some View {
        ResizedImage(product.imageName)
            .frame(width: 120)
            .clipped()
    }
    
    var productDescription: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text(product.description)
                .font(.footnote)
                .foregroundColor(Color.secondaryText)
            
            Spacer()
            
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    
    var footerView: some View {
        HStack(spacing: 0) {
            Text("₩").font(.footnote)
            + Text("\(product.price)").font(.headline)
            
            Spacer()
            
            FavoriteButton(product: product)
            
            Symbol("cart", color: Color.peach)
                .frame(width: 32, height: 32)
        }
    }
}


struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          ForEach(productSamples) {
            ProductRow(product: $0)
          }
          ProductRow(product: productSamples[0])
            .preferredColorScheme(.dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
        
    }
}

let productSamples = [
  Product(name: "나는야 무화과", imageName: "fig", price: 3100, description: "소화가 잘되고 변비에 좋은 달달한 국내산 무화과에요. 고기와 찰떡궁합!"),
  Product(name: "유기농 아보카도", imageName: "avocado", price: 2900, description: "미네랄도 풍부하고, 요리 장식과 소스로도 좋은 아보카도입니다"),
  Product(name: "바나나 안 바나나", imageName: "banana", price: 2400, description: "달콤한 맛의 바나나. 이렇게 맛있으니 내가 바나나 안 바나나?", isFavorite: true),
  Product(name: "아임 파인애플", imageName: "pineapple", price: 3000, description: "소화와 피로회복, 비타민까지! 파인애플로 맛과 영양까지 한번에!"),
  Product(name: "시원한 수박", imageName: "watermelon", price: 3500, description: "아이들이 너무나 좋아하는 시원하고 달콤한 하우스 수박이에요", isFavorite: true),
  Product(name: "베리베리 블루베리", imageName: "blueberry", price: 2300, description: "타임지 선정 10대 파워 푸드. 신이 내린 선물이라 불리는 블루베리에요"),
]
