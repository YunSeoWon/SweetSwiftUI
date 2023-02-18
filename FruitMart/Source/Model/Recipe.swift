//
//  Recipe.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/17.
//  Copyright © 2023 Giftbot. All rights reserved.
//

struct Recipe {
    let name: String
    let imageName: String
}

let recipeSamples = [
    "토마토 치즈 베네딕트" : 1,
    "구운 토마토와 등심 스테이크" : 2,
    "볼로네이즈 스파게티" : 3,
    "크림치즈 샐러드" : 4,
    "토마토 바질페스토 샐러드" : 5
].map { Recipe(name: $0.key, imageName: "recipe0\($0.value)") }
