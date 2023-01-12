//
//  ColorExtension.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/12.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

/**
 * 자주 사용하는 색상을 컬러 익스텐션에 추가해서 사용.
 */
extension Color {
    
    /** 앱에서 사용할 메인 색 **/
    static let peach = Color("peach")
    
    /** 그림자에 사용할 색 **/
    static let primaryShadow = Color.primary.opacity(0.2)
    
    /** Color.secondary를 대신해 사용할 조금 더 진한 회색 **/
    static let secondaryText = Color(hex: "#6e6e6e")
    
    /** UIColor 값으로 Color를 생성할 수 있다. **/
    static let background = Color(UIColor.systemGray6)
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        
        /** 문자열을 Int64 타입으로 변환하여 rgb 변수에 저장. 변환할 수 없다면 0 반환 **/
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
