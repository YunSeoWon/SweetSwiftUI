//
//  BundleExtension.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/18.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

/**
 * ProductData.json 파일에 들어있는 JSON 구조의 데이터를 메모리로 읽어와 리스트에 전달하기 위해 사용되는 번들 기능 확장
 */
extension Bundle {
    func decode<T: Decodable>(filename: String, as type: T.Type) -> T {
        guard let url = self.url(forResource: filename, withExtension: nil) else {
            fatalError("번들에 \(filename)이 없습니다.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("\(url)로부터 데이터를 불러올 수 없습니다.")
        }
        
        /** JSONDecoder().decode() 는 반환타입이 Decodable 프로토콜을 준수해야 한다. **/
        guard let decodedData = try? Bundle.decoder.decode(T.self, from: data) else {
            fatalError("데이터 복호화에 실패했습니다.")
        }
        
        return decodedData
    }
    
    static let decoder = JSONDecoder()
}
