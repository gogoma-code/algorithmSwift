import SwiftUI

/// - 문자열 다루기 기본
/// - https://programmers.co.kr/learn/courses/30/lessons/12918?language=swift
func solution12918(_ s:String) -> Bool {
    guard let _: Int = Int(s), (s.count == 4 || s.count == 6) else {
        return false
    }
    return true
}

/// - 문자열 내 p와 y의 개수
/// - https://programmers.co.kr/learn/courses/30/lessons/12916?language=swift
func solution12916(_ s:String) -> Bool {
    return s.filter{ $0.uppercased() == "Y" }.count == s.filter{ $0.uppercased() == "P" }.count
}

/// - 문자열을 정수로 바꾸기
/// - https://programmers.co.kr/learn/courses/30/lessons/12925?language=swift
func solution12925(_ s:String) -> Int {
    return Int(s) ?? 0
}

/// - 가운데 글자 가져오기
/// - https://programmers.co.kr/learn/courses/30/lessons/12903?language=swift
func solution12903_V1(_ s:String) -> String {
    let startIndex: String.Index = s.index(s.startIndex, offsetBy: s.count/2 - (s.count % 2 == 0 ? 1 : 0))
    let endIndex: String.Index = s.index(s.startIndex, offsetBy: s.count/2+1)
    
    return String(s[startIndex..<endIndex])
}
func solution12903_V2(_ s:String) -> String {
    return String(Array(s)[s.count/2 - (s.count % 2 == 0 ? 1 : 0)...s.count/2])
}

/// - 자릿수 더하기
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

/// - 두 정수 사이의 합
/// - https://programmers.co.kr/learn/courses/30/lessons/12912?language=swift
func solution12912_V1(_ a:Int, _ b:Int) -> Int64 {
    var sum: Int = 0
    for val in (a < b ? a : b)...(a < b ? b : a) {
        sum += val
    }
    return Int64(sum)
}
func solution12912_V2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}

/// - 짝수와 홀수
/// - https://programmers.co.kr/learn/courses/30/lessons/12937?language=swift
func solution12937(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
}

/// - 나누어 떨어지는 숫자 배열
/// - https://programmers.co.kr/learn/courses/30/lessons/12910?language=swift
func solution12910(_ arr:[Int], _ divisor:Int) -> [Int] {
    let ary: [Int] = Array.sorted(arr.filter { $0 % divisor == 0 })()
    return ary.isEmpty ? [-1] : ary
}

/// - 정수 내림차순으로 배치하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12933?language=swift
func solution12933(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted().reversed())) ?? 0
}

/// - 수박수박수박수박수박수?
/// - https://programmers.co.kr/learn/courses/30/lessons/12922?language=swift
func solution12922_V1(_ n:Int) -> String {
    var answer: String = ""
    for _ in 0..<n/2 {
        answer += "수박"
    }
    return n % 2 == 0 ? answer : answer + "수"
}
func solution12922_V2(_ n:Int) -> String {
    let answer: String = (0..<n/2).map { _ in "수박" }.reduce("", +)
    return n % 2 == 0 ? answer : answer + "수"
}
