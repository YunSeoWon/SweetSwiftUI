//
//  OrderViewModel.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    private let service: OrderService
    
    init(service: OrderService) {
        self.service = service
    }
    
    func order(product: Product, quantity: Int) -> Bool {
        return service.order(
            Order(product: product, quantity: quantity)
        )
    }
}
