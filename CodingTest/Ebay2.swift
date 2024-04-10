//
//  Ebay2.swift
//  CodingTest
//
//  Created by Sunwoo on 2024/04/06.
//

import Foundation

func solution3(_ work: [Int], _ coreTime: Int) -> Int {
    let totalHours = 8
    var maxWork = 0
    
    // 모든 가능한 근무 시간 조합을 탐색합니다.
    for startHour in 0..<24 {
        for endHour in startHour..<24 {
            var workingHour = endHour - startHour + 1
            if workingHour > totalHours { continue } // 8시간을 초과하는 경우는 제외
            
            // 코어 타임을 포함하는지 확인합니다.
            if startHour <= coreTime && coreTime <= endHour {
                // 근무 시간이 8시간 미만인 경우, 나머지 시간을 추가로 선택해야 합니다.
                if workingHour < totalHours {
                    for secondStartHour in 0..<24 where secondStartHour > endHour || secondStartHour + totalHours - workingHour - 1 < startHour {
                        let secondEndHour = secondStartHour + totalHours - workingHour - 1
                        if secondEndHour >= 24 { continue } // 24시간을 초과하는 경우는 제외
                        
                        // 두 구간의 업무량을 합산합니다.
                        let workTotal = work[startHour...endHour].reduce(0, +) + work[secondStartHour...secondEndHour].reduce(0, +)
                        maxWork = max(maxWork, workTotal)
                    }
                } else {
                    // 근무 시간이 정확히 8시간인 경우, 해당 구간의 업무량을 계산합니다.
                    let workSum = work[startHour...endHour].reduce(0, +)
                    maxWork = max(maxWork, workSum)
                }
            }
        }
    }
    
    return maxWork
}
