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
        }.frame(height: 150)
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
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
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
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
        }
    }
}
