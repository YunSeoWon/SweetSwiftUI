//
//  Order.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 }
    
    let id: Int
    let product: Product
    let quantity: Int
    
    init(product: Product, quantity: Int) {
        self.id = Order.orderSequence.next()!
        self.product = product
        self.quantity = quantity
    }
    
    var price: Int {
        product.price * quantity
    }
}
