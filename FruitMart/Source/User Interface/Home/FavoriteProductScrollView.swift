//
//  FavoriteProductScrollView.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/12.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteProductSrcollView: View{
    @EnvironmentObject private var viewModel: ProductViewModel
    @Binding var showingImage: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            title
            if showingImage {
                products
            }
        }.padding()
    }
    
    private var title: some View {
        HStack {
            Text("즐겨찾는 상품")
                .font(.headline)
                .fontWeight(.medium)
            
            /**
             * showingImage에 따라서 180도 회전시킬지 결정
             * 심볼 자체를 down으로 바꿔도 되는데 애니메이션을 위해 rotation 적용
             */
            Symbol("arrowtriangle.up.square")
                .padding(4)
                .rotationEffect(Angle(radians: showingImage ? .pi : 0))
            
            Spacer()
        }
        .padding()
        .onTapGesture { self.showingImage.toggle() }
    }
    
    private var products: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                let favoriteProducts = viewModel.favoriteProducts
                ForEach(favoriteProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        self.eachProduct(product)
                    }
                }
            }.padding([.top, .leading], 10)
        }
    }
    
    private func eachProduct(_ product: Product) -> some View {
        GeometryReader {
            ResizedImage(product.imageName, renderingMode: .original)
                .clipShape(Circle())
                .frame(width: 90, height: 90)
                .scaleEffect(self.scaledValue(from: $0))
        }
        .frame(width: 105, height: 105)
    }
    
    private func scaledValue(from geometry: GeometryProxy) -> CGFloat {
        // ScrollView를 기준으로 한 contentOffset (16: 스크롤 뷰에 적용된 좌측 여백의 값)
        let xOffset = geometry.frame(in: .global).minX - 16
        let minSize: CGFloat = 0.9
        let maxSize: CGFloat = 1.1
        let delta: CGFloat = maxSize - minSize
        
        /**
         * 상품별로 contentOffset의 x좌표가 0일 때 최대 크기인 1.1배,
         * 화면의 너비와 같은 값을 가지는 위치에 있을 때 최소 크기인 0.9배가 되도록 한다.
         * 스크롤하여 움직일 때 마다 현재 위치에 따라 크기가 변화폭 만큼 변할 수 있다.
         */
        let size = minSize + delta * (1 - xOffset / UIScreen.main.bounds.width)
        
        /**
         * 즐거찾기 상품이 좌 우측으로 화면 밖을 벗어날 때는 지정한 최소/최대 크기보다 더 작거나 커진다.
         * 화면상에서는 보이지 않으므로 무시해도 되지만 최소와 최대 범위를 0.9와 1.1로 설정값에 맞게 제한하였다.
         */
        return max(min(size, maxSize), minSize)
    }
}
