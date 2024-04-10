//
//  Ebay3.swift
//  CodingTest
//
//  Created by Sunwoo on 2024/04/06.
//

import Foundation

func solution4(_ m:Int, _ temperatures:[Int], _ clothes:[[Int]]) -> Int {
    let n = temperatures.count
    var bestStartDay = 0
    var minClothesNeeded = Int.max

    for startDay in 0...(n - m) {
        var clothesNeeded = Set<Int>()
        for day in startDay..<(startDay + m) {
            let temp = temperatures[day]
            for (index, clothRange) in clothes.enumerated() {
                if temp >= clothRange[0] && temp <= clothRange[1] {
                    clothesNeeded.insert(index)
                }
            }
        }
        if clothesNeeded.count < minClothesNeeded {
            minClothesNeeded = clothesNeeded.count
            bestStartDay = startDay + 1 // 날짜는 1부터 시작하므로 +1을 해줍니다.
        }
    }

    return bestStartDay

}
