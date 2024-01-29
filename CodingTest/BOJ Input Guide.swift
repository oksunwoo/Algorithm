//
//  BOJ Input Guide.swift
//  CodingTest
//
//  Created by Sunwoo on 2024/01/30.
//

import Foundation

//기본형태
func guide1() {
    let input = readLine()!
    print(input + ", " + "\(type(of: input))")

    // 입력 : 10
    // 결과 : 10, String

    // readLine() 에 ! 를 붙이지 않으면 Optional String 으로 받는다.
}

//정수로 입력받기
func guide2() {
    let input = Int(readLine()!)!
    print("\(input)" + ", " + "\(type(of: input))")

    // 입력 : 10
    // 결과 : 10, Int

    //readLine()! 으로 받더라도, String 이 Int 로 캐스팅 실패할 수도 있으므로 !를 붙여 그럴 가능성이 없다고 선언한다.
}

//끝날 때 까지 계속 입력받기
func guide3() {
    var str = ""
    while let readString = readLine() {
        str += readString
    }
}

//문자열을 Array<Character> 으로 받기
func guide4() {
    let input = Array(readLine()!)
    print("\(input)" + " " + "\(type(of: input))")

    // 입력 : ABABAB
    // 결과 : ["A", "B", "A", "B", "A", "B"] Array<Character>
}

//공백문자를 기준으로 띄워서 Array<String> 으로 받기
func guide5() {
    let input = readLine()!.components(separatedBy: " ")
    print("\(input)" + " " + "\(type(of: input))")

    // components 는 foundation Library 에 포함되어있다.
    // 입력 : A B A B A B
    // 결과 : ["A", "B", "A", "B", "A", "B"] Array<String>
}

//공백문자를 기준으로 띄워서 Array<Int> 으로 받기
func guide6() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    print("\(input)" + " " + "\(type(of: input))")

    // 입력 : 1 0 1 0 1
    // 결과 : [1, 0, 1, 0, 1] Array<Int>
}

//한 줄 정수를 Array<Int> 로 입력받기
func guide7() {
    let input = Array(readLine()!).map{ Int(String($0))! }
    print("\(input)" + ", " + "\(type(of: input))")

    // String 형변환 후 Int 로 하면 속도가 더 빠르다.
    // 이유는 SubString 과 String 의 차이

    // 입력 : 10101
    // 결과 : [1, 0, 1, 0, 1], Array<Int>
}

//공백문자를 기준으로 띄워서 이차원배열에 Array<Int> 로 받기
func guide8() {
    var input = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)
    for i in 0...input.count - 1 {
        input[i] = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
    }

    print("\(input)" + " " + "\(type(of: input))")

    // 입력 :
    //    0 1 1 1 1
    //    0 1 1 1 1
    //    0 0 0 1 1
    //    1 1 0 0 0
    //    1 1 1 1 0

    // 결과 :
    //     [[0, 1, 1, 1, 1], [0, 1, 1, 1, 1], [0, 0, 0, 1, 1], [1, 1, 0, 0, 0], [1, 1, 1, 1, 0]] Array<Array<Int>>
}

//공백문자 없이 이차원배열에 Array<Int> 로 받기
func guide9() {
    var input = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)
    for i in 0...input.count - 1 {
        input[i] = Array(readLine()!.map{Int(String($0))! })
    }

    print("\(input)" + " " + "\(type(of: input))")

    // 입력 :
    //    01111
    //    01111
    //    00011
    //    11000
    //    11110

    // 결과 :
    //    [[0, 1, 1, 1, 1], [0, 1, 1, 1, 1], [0, 0, 0, 1, 1], [1, 1, 0, 0, 0], [1, 1, 1, 1, 0]] Array<Array<Int>>
}

//공백문자를 기준으로 띄워서 이차원배열에 Array<String> 로 받기
func guide10() {
    var input = [[String]](repeating: [String](repeating: "", count: 5), count: 5)
    for i in 0...input.count - 1 {
        input[i] = readLine()!.components(separatedBy: " ")
    }

    print("\(input)" + " " + "\(type(of: input))")

    // 입력 :
    //    A B B B B
    //    A B B B B
    //    A A A B B
    //    B B A A A
    //    B B B B A

    // 결과 :
    //    [["A", "B", "B", "B", "B"], ["A", "B", "B", "B", "B"], ["A", "A", "A", "B", "B"], ["B", "B", "A", "A", "A"], ["B", "B", "B", "B", "A"]] Array<Array<String>>
}

//공백문자 없이 이차원배열에 Array<String> 로 받기 - 1
func guide11() {
    var input = [String](repeating: "", count: 5)
    for i in 0...input.count - 1 {
        input[i] = readLine()!
    }

    print("\(input)" + " " + "\(type(of: input))")

    // 입력 :
    //    ABBBB
    //    ABBBB
    //    AAABB
    //    BBAAA
    //    BBBBA

    // 결과 :
    //    ["ABBBB", "ABBBB", "AAABB", "BBAAA", "BBBBA"] Array<String>

}

//공백문자 없이 이차원배열에 Array<String> 로 받기 - 2
func guide12() {
    var input = [[String]](repeating: [String](repeating: "", count: 5), count: 5)
    for i in 0...input.count - 1 {
        input[i] = Array(readLine()!.map{ String($0) })
    }

    print("\(input)" + " " + "\(type(of: input))")

    // 입력 :
    //    ABBBB
    //    ABBBB
    //    AAABB
    //    BBAAA
    //    BBBBA

    // 결과 :
    //    [["A", "B", "B", "B", "B"], ["A", "B", "B", "B", "B"], ["A", "A", "A", "B", "B"], ["B", "B", "A", "A", "A"], ["B", "B", "B", "B", "A"]] Array<Array<String>>
}
