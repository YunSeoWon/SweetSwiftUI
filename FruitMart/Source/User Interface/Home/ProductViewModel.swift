//
//  HomeViewModel.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    
    private let productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
        
        self.fetch()
    }
    
    func fetch() {
        self.products = productService.getAll()
    }
    
    func toggleFavorite(of product: Product) {
        guard let index = products.firstIndex(of: product) else {
            return
        }
        products[index].isFavorite.toggle()
    }
}
