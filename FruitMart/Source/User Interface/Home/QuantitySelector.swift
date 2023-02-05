//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    
    /**
     *  햅틱 피드백 적용
     *  액션을 취한 후 진동을 줄 수 있다.
     */
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rightFeedback = UIImpactFeedbackGenerator(style: .rigid)
    
    var range: ClosedRange<Int> = 1...20
    
    var body: some View {
        HStack {
            Button(action: { changeQuantity(number: -1) }) {
                Symbol("minus.circle.fill", scale: .large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            Button(action: { changeQuantity(number: 1) }) {
                Symbol("plus.circle.fill", scale: .large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
        }
    }
    
    func changeQuantity(number: Int) {
        if range ~= quantity + number {
            quantity += number
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        } else {
            rightFeedback.prepare()
            rightFeedback.impactOccurred()
        }
    }
}


struct QuantitySelector_Preview: PreviewProvider {
    
    static var previews: some View {
        Group {
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
