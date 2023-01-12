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
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }.frame(height: 150)
            .background(Color.primary.colorInvert())
            .cornerRadius(6)
            .shadow(color: Color.primary.opacity(0.33), radius: 1, x: 2, y: 2)
            .padding(.vertical, 8)
    }
}

/**
 * 세부 뷰 정의
 */
private extension ProductRow {
    
    var productImage: some View {
        Image("apple")
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    
    var productDescription: some View {
        VStack(alignment: .leading) {
            Text("백설공주 사과")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text("달콤한 맛이 좋은 과일의 여왕 사과. 독은 없고 꿀만 가득해요!")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    
    var footerView: some View {
        HStack(spacing: 0) {
            Text("₩").font(.footnote)
            + Text("2100").font(.headline)
            
            Spacer()
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color("peach"))
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .foregroundColor(Color("peach"))
                .frame(width: 32, height: 32)
        }
    }
}
