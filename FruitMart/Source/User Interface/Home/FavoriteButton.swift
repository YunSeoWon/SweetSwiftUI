//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill" : "heart"
    }
    
    var body: some View {
        Symbol(imageName, scale: .large, color: .peach)
            .frame(width: 32, height: 32)
            .onTapGesture {
                self.viewModel.toggleFavorite(of: self.product)
            }
    }
}
