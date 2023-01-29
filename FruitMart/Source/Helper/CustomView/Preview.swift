//
//  Preview.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/29.
//  Copyright © 2023 Giftbot. All rights reserved.
//

/**
 * 자주 비교하게 될 기기들을 지정해 두고 쉽게 재사용할 수 있도록 프리뷰에서만 활용하는 용도로 Preview 생성
 */
import SwiftUI

struct Preview<V: View>: View {
    enum Device: String, CaseIterable {
        case iPhone8 = "iPhone 8"
        case iPhone11 = "iPhone 11"
        case iPhone11Pro = "iPhone 11 Pro"
        case iPhone11ProMax = "iPhone 11 Pro Max"
    }
    
    let source: V
    
    /**
     * 프리뷰에서 렌더링할 기기에 대한 기본값을 정의한다.
     */
    var devices: [Device] = [.iPhone11Pro, .iPhone11ProMax, .iPhone8]
    var displayDarkMode: Bool = true
    
    var body: some View {
        Group {
            ForEach(devices, id: \.self) {
                self.previewSource(device: $0, displayDarkMode: false)
            }
            
            /**
             * 다크모드 환경에서의 결과 화면을 확인하기 위해 그룹으로 뷰를 나눔
             */
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0], displayDarkMode: displayDarkMode)
                    .preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device: Device, displayDarkMode: Bool) -> some View {
        let dark: String = displayDarkMode ? "_dark" : ""
        
        return source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName("\(device.rawValue)\(dark)")
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        
        /**
         * Preview source 매개변수에 간접적으로 뷰를 전달하는 형태로 사용하여 매번 프리뷰를 볼 때마다
         * 쉽게 미리 정의해 둔 목록에 따라 화면을 비교할 수 있다.
         */
        Preview(source: Text("Hello, SwiftUI"))
    }
}
