//
//  BOJ11659.swift
//  CodingTest
//
//  Created by Sunwoo on 2024/01/31.
//

import Foundation

func solution2(n: Int, recent: Int, recently_use: Int, total_use: Int, records: [[Int]]) -> [Int] {
    var totalUsage = [Int: Int]() // 전체 이용 시간을 저장할 딕셔너리
    var recentUsage = [Int: Int]() // 최근 이용 시간을 저장할 딕셔너리
    
    for record in records {
        let dayAgo = record[0]
        let appId = record[1]
        let usageTime = record[2]
        
        // 전체 이용 시간 업데이트
        totalUsage[appId, default: 0] += usageTime
        
        // 최근 이용 시간 업데이트
        if dayAgo <= recent {
            recentUsage[appId, default: 0] += usageTime
        }
    }
    
    var appsToDelete = [Int]() // 삭제할 앱의 ID를 저장할 배열
    
    // 조건을 검사하여 삭제 대상 앱 찾기
    for appId in 1...n {
        let recentTime = recentUsage[appId, default: 0]
        let totalTime = totalUsage[appId, default: 0]
        
        if recentTime <= recently_use && totalTime < total_use {
            appsToDelete.append(appId)
        }
    }
    
    // 앱 번호를 오름차순으로 정렬하여 반환
    return appsToDelete.sorted()
}
