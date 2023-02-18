//
//  Stripes.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/18.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct Stripes: Shape {
    var stripes: Int = 30
    var insertion: Bool = true
    var ratio: CGFloat
    
    var animatableData: CGFloat {
        get { ratio }
        set { ratio = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let stripeWidth = rect.width / CGFloat(stripes)
        let rects = (0..<stripes).map { (index: Int) -> CGRect in
            // 줄무늬 시작점 x좌표
            let xOffset = CGFloat(index) * stripeWidth
            
            // 삽입될 뷰인지 제거될 뷰인지 구분하여 줄무늬 위치 조정
            let adjustment = insertion ? 0 : (stripeWidth * (1 - ratio))
            
            return CGRect(
                x: xOffset + adjustment, // 조정값을 더하여 최종 위치 결정
                y: 0,
                width: stripeWidth * ratio, // 줄무늬 너비
                height: rect.height
            )
        }
        
        path.addRects(rects) // 만들어진 모든 줄무늬를 path에 추가
        return path
    }
}

extension Stripes: Hashable {}
