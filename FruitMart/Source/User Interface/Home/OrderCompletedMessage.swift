//
//  OrderCompletedMessage.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/05.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
            .font(.system(size: 24))
            .bold()
            .kerning(2)
    }
}
