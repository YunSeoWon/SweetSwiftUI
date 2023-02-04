//
//  Store.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

final class Store: ObservableObject {
    @Published var products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

extension Store {
    func toggleFavorite(of product: Product) {
        guard let index = products.firstIndex(of: product) else {
            return
        }
        products[index].isFavorite.toggle()
    }
}
