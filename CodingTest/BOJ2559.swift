//
//  BOJ2559.swift
//  CodingTest
//
//  Created by Sunwoo on 2024/01/22.
//

import Foundation

func solution1() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let temperatures = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var prefixSum = [0] + temperatures
    for i in 1..<prefixSum.count {
        prefixSum[i] = prefixSum[i] + prefixSum[i - 1]
    }
    
    var maxSum = Int.min
    for i in input[1]..<prefixSum.count {
        maxSum = max(prefixSum[i] - prefixSum[i - input[1]], maxSum)
    }
    
    print(maxSum)
    
}


