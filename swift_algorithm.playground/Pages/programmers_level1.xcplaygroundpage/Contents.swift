import SwiftUI
import Foundation

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

/// - 서울에서 김서방 찾기
/// - https://programmers.co.kr/learn/courses/30/lessons/12919?language=swift
func solution12919(_ seoul:[String]) -> String {
    var answer: String = ""
    if let index = seoul.firstIndex(of: "Kim") {
        answer =  "김서방은 \(index)에 있다"
    }
    
    return answer
}

/// - 핸드폰 번호 가리기
/// - https://programmers.co.kr/learn/courses/30/lessons/12948?language=swift
func solution12948_V1(_ phone_number:String) -> String {
    let phone_blind = phone_number.enumerated().map { (idx, val) -> Character in
        if idx < phone_number.count-4 {
            return "*"
        } else {
            return val
        }
    }
    
    return String(phone_blind)
}
func solution12948_V2(_ phone_number:String) -> String {
    return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
}


/// - 자연수 뒤집어 배열로 만들기
/// - https://programmers.co.kr/learn/courses/30/lessons/12932?language=swift
func solution12932_V1(_ n:Int64) -> [Int] {
    return String(String(n).reversed()).map { (c: Character) -> Int in
        return Int(String(c))!
    }
}
func solution12932_V2(_ n:Int64) -> [Int] {
    return String(n).compactMap { $0.hexDigitValue }.reversed()
}
func solution12932_V3(_ n:Int64) -> [Int] {
    var intAry: [Int] = []
    var tmpN: Int = Int(n)
    while tmpN != 0 {
        intAry.append(tmpN % 10)
        tmpN /= 10
    }
    return intAry
}

/// - 제일 작은 수 제거하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12935?language=swift
func solution12935(_ arr:[Int]) -> [Int] {
    var returnAry = arr
    var min: Int = Int.max
    for number in returnAry {
        if min > number {
            min = number
        }
    }
    
    returnAry.remove(at: returnAry.firstIndex(of: min)!)
    return returnAry.isEmpty ? [-1] : returnAry
}

/// - x만큼 간격이 있는 n개의 숫자
/// - https://programmers.co.kr/learn/courses/30/lessons/12954?language=swift
func solution12954_V1(_ x:Int, _ n:Int) -> [Int64] {
    var returnAry: [Int64] = []
    for i in 0..<n {
        returnAry.append(Int64(x + (i*x)))
    }
    return returnAry
}
func solution12954_V2(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map { Int64(x * $0) }
}

/// - 평균 구하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12944?language=swift
func solution12944(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, {$0 + $1})) / Double(arr.count)
}

/// - 문자열 내림차순으로 배치하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12917?language=swift
func solution12917(_ s:String) -> String {
    return String(s.sorted { $0 > $1 })
}

/// - 정수 제곱근 판별
/// - https://programmers.co.kr/learn/courses/30/lessons/12934?language=swift
func solution12934_V1(_ n:Int64) -> Int64 {
    let nSqrt: Double = sqrt(Double(n))
    return nSqrt - nSqrt.rounded() == 0 ? Int64(pow(nSqrt+1, 2)) : -1
}
func solution12934_V2(_ n:Int64) -> Int64 {
    let nSqrt: Int64 = Int64(sqrt(Double(n)))
    return nSqrt * nSqrt == n ? (nSqrt+1) * (nSqrt+1) : -1
}

/// - 직사각형 별찍기
/// - https://programmers.co.kr/learn/courses/30/lessons/12969?language=swift
/*
let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    for _ in 0..<a {
        print("*", terminator: "")
    }
    print()
}
 
for _ in 0..<b {
 print(String((0..<a).map { _ in "*" }))
}
*/

/// - 행렬의 덧셈
/// - https://programmers.co.kr/learn/courses/30/lessons/12950?language=swift
func solution12950_V1(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: arr1[0].count), count: arr1.count)
    for i in 0..<arr1.count {
        for j in 0..<arr1[0].count {
            arr[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return arr
}
func solution12950_V2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0, $1).map{$0+$1}}
}

/// - 최대공약수와 최소공배수
/// - https://programmers.co.kr/learn/courses/30/lessons/12940?language=swift
func solution12940_V1(_ n:Int, _ m:Int) -> [Int] {
    return [gcd12940(n,m), lcm12940(n,m)]
}
func gcd12940(_ n:Int, _ m:Int) -> Int {
    return m == 0 ? n : gcd12940(m, n % m)
}
func lcm12940(_ n:Int, _ m:Int) -> Int {
    return n * m / gcd12940(n, m)
}
func solution12940_V2(_ n:Int, _ m:Int) -> [Int] {
    var a: Int = n
    var b: Int = m
    var temp: Int = 0
    while b > 0 {
        temp = b
        b = a % b
        a = temp
    }
    let gcd: Int = a
    let lcm: Int = n * m / gcd
    
    return [gcd, lcm]
}
func solution12940_V3(_ n:Int, _ m:Int) -> [Int] {
    var gcd: Int = 1
    for index in 1...min(n, m) {
        if n % index == 0 && m % index == 0 {
            gcd = index
        }
    }
    
    return [gcd, n * m / gcd]
}

/// - 약수의 합
/// - https://programmers.co.kr/learn/courses/30/lessons/12928?language=swift
func solution12928_V1(_ n:Int) -> Int {
    if n == 0 { return 0 }
    return (1...n).filter { n % $0 == 0 }.reduce(0, +)
}
func solution12928_V2(_ n:Int) -> Int {
    var sum: Int = 0
    if n != 0 {
        for index in 1...n {
            if n % index == 0 {
                sum += index
            }
        }
    }
    return sum
}

/// - 콜라츠 추측
/// - https://programmers.co.kr/learn/courses/30/lessons/12943?language=swift
func solution12943(_ num:Int) -> Int {
    var count: Int = 0
    var numTemp: Int = num
    while numTemp != 1 && count <= 500{
        if numTemp.isMultiple(of: 2) {
            numTemp /= 2
        } else {
            numTemp = numTemp * 3 + 1
        }
        count += 1
    }
    return count < 500 ? count : -1
}

/// - 하샤드 수
/// - https://programmers.co.kr/learn/courses/30/lessons/12947?language=swift
func solution12947(_ x:Int) -> Bool {
    return x % String(x).map { Int(String($0))! }.reduce(0, +) == 0
}

/// - 소수 찾기
/// - https://programmers.co.kr/learn/courses/30/lessons/12921?language=swift
func solution12921(_ n:Int) -> Int {
    var primes: [Bool] = [Bool](repeating: true, count: n+1)
    primes[1] = false
    
    for i in 2...n {
        var j: Int = 2
        while i*j <= n {
            primes[i*j] = false
            j += 1
        }
    }
    
    return primes.filter{ $0 }.count - 1
}

/// - 예산
/// - https://programmers.co.kr/learn/courses/30/lessons/12982?language=swift
func solution12982(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0
    let count = d.sorted().filter {
        sum += $0
        return sum <= budget
    }.count
    
    return count
}

/// - K번째수
/// - https://programmers.co.kr/learn/courses/30/lessons/42748?language=swift
func solution42748_V1(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    for i in 0..<commands.count {
        answer.append(array[(commands[i][0]-1)...(commands[i][1]-1)].sorted()[commands[i][2]-1])
    }
    
    return answer
}
func solution42748_V2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map{ array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1] }
}

/// - 모의고사
/// - https://programmers.co.kr/learn/courses/30/lessons/42840?language=swift
func solution42840(_ answers:[Int]) -> [Int] {
    let supo1: [Int] = [1, 2, 3, 4, 5]
    let supo2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let supo3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var supoAry: [Int] = [0, 0, 0]
    
    for i in 0..<answers.count {
        if answers[i] == supo1[i%5] { supoAry[0] = supoAry[0] + 1 }
        if answers[i] == supo2[i%8] { supoAry[1] = supoAry[1] + 1 }
        if answers[i] == supo3[i%10] { supoAry[2] = supoAry[2] + 1 }
    }
    
    let supoAryTuple: [(Int, Int)] = supoAry.enumerated().map { ($0+1, $1) }.sorted { $0.1 > $1.1 }
    let compareNum: Int = supoAryTuple[0].1
    
    return supoAryTuple.filter{ compareNum == $0.1 }.map { $0.0 }
}

/// - 2016년
/// - https://programmers.co.kr/learn/courses/30/lessons/12901?language=swift
func solution12901(_ a:Int, _ b:Int) -> String {
    let dayOfMonth: [Int] = [31,29,31,30,31,30,31,31,30,31,30,31]
    let weeks: [String] = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let sumOfDay: Int = dayOfMonth[0..<a-1].reduce(0, +) + b + 4
    print(sumOfDay)
    
    return weeks[sumOfDay % 7]
}


