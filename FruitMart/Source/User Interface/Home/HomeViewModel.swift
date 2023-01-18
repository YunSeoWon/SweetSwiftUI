//
//  HomeViewModel.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

class HomeViewModel {
    private let productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
    }
    
    func fetch() -> [Product] {
        return productService.getAll()
    }
}
