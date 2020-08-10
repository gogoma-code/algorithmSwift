import SwiftUI

/// - https://programmers.co.kr/learn/courses/30/lessons/12918?language=swift
func solution12918(_ s:String) -> Bool {
    guard let _: Int = Int(s), (s.count == 4 || s.count == 6) else {
        return false
    }
    return true
}

/// - https://programmers.co.kr/learn/courses/30/lessons/12916?language=swift
func solution12916(_ s:String) -> Bool {
    return s.filter{ $0.uppercased() == "Y" }.count == s.filter{ $0.uppercased() == "P" }.count
}

/// - https://programmers.co.kr/learn/courses/30/lessons/12925?language=swift
func solution12925(_ s:String) -> Int {
    return Int(s) ?? 0
}

/// - https://programmers.co.kr/learn/courses/30/lessons/12903?language=swift
func solution12903_V1(_ s:String) -> String {
    let startIndex: String.Index = s.index(s.startIndex, offsetBy: s.count/2 - (s.count % 2 == 0 ? 1 : 0))
    let endIndex: String.Index = s.index(s.startIndex, offsetBy: s.count/2+1)
    
    return String(s[startIndex..<endIndex])
}
func solution12903_V2(_ s:String) -> String {
    return String(Array(s)[s.count/2 - (s.count % 2 == 0 ? 1 : 0)...s.count/2])
}

/// - https://programmers.co.kr/learn/courses/30/lessons/12931?language=swift
func solution12931_V1(_ n:Int) -> Int {
    var tmp: Int = n
    var sum: Int = 0
    while tmp != 0 {
        sum += tmp % 10
        tmp /= 10
        print(sum)
    }
    return sum
}
func solution12931_V2(_ n:Int) -> Int {
    return String(n).reduce(0, {$0 + Int(String($1))! })
}
func solution12931_V3(_ n:Int) -> Int {
    let arr: [Int] = String(n).compactMap{ Int(String($0)) }
    return arr.reduce(0, { $0+$1 })
}
