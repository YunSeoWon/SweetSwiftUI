//
//  OrderService.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

class OrderService {
    private let clientPort: OrderClientPort
    
    init(clientPort: OrderClientPort) {
        self.clientPort = clientPort
    }
    
    func order(_ order: Order) -> Bool {
        return clientPort.order(order: order)
    }
}
