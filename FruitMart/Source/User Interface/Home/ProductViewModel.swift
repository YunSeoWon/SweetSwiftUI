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
    
    var favoriteProducts: [Product] {
        get {
            products.filter { $0.isFavorite }
        }
    }
    
    private let service: ProductService
    
    init(service: ProductService) {
        self.service = service
        
        self.fetch()
    }
    
    func fetch() {
        self.products = service.getAll()
    }
    
    func toggleFavorite(of product: Product) {
        guard let index = products.firstIndex(of: product) else {
            return
        }
        products[index].isFavorite.toggle()
    }
}
