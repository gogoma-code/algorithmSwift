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

/// - 시저 암호
/// - https://programmers.co.kr/learn/courses/30/lessons/12926
func solution12926_V1(_ s:String, _ n:Int) -> String {
    var answer: String = ""
    for i8Code in s.utf8 {
        var iCode: Int = Int(i8Code)
        switch iCode {
        case 65...90:
            iCode = (iCode + n - 65) % 26 + 65
        case 97...122:
            iCode = (iCode + n - 97) % 26 + 97
        default:
            break
        }
        
        answer += String(UnicodeScalar(iCode)!)
    }
    
    return answer
}
func solution12926_V2(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
            case 65...90:
                code = (code + n - 65) % 26 + 65
            case 97...122:
                code = (code + n - 97) % 26 + 97
            default:
                break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

/// - 문자열 내 마음대로 정렬하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12915?language=swift
func solution12915(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted{
        let first = $0[$0.index($0.startIndex, offsetBy: n)]
        let second = $1[$1.index($1.startIndex, offsetBy: n)]
        
        if first == second { return $0 < $1 }
        else { return first < second }
    }
}

/// - 이상한 문자 만들기
/// - https://programmers.co.kr/learn/courses/30/lessons/12930?language=swift
func solution12930_V1(_ s:String) -> String {
    var index: Int = 0
    
    return s.map { (char: Character) -> String in
        var str: String = ""
        if char != " " {
            if index % 2 == 0 {
                str = char.uppercased()
            } else {
                str = char.lowercased()
            }
            index += 1
        } else {
            index = 0
            str = String(char)
        }
        return str
    }.joined()
}
func solution12930_V2(_ s:String) -> String {
    let str = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    return str.map{ $0.joined() }.joined(separator: " ")
}

/// - 체육복
/// - https://programmers.co.kr/learn/courses/30/lessons/42862?language=swift
func solution42862(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserveAry: [Int] = reserve
    var lostAry = lost.filter {
        for i in 0..<reserveAry.count {
            if $0 == reserveAry[i] {
                reserveAry[i] = -1
                return false
            }
        }
        return true
    }
    
    lostAry = lostAry.filter {
        for i in 0..<reserveAry.count {
            if $0 == reserveAry[i] - 1 || $0 == reserveAry[i] + 1 {
                reserveAry[i] = -1
                return false
            }
        }
        return true
    }
    
    return n - lostAry.count
}

/// - 크레인 인형뽑기 게임
/// - https://programmers.co.kr/learn/courses/30/lessons/64061?language=swift
func solution64061(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boards: [[Int]] = board
    var basket: [Int] = []
    var answer: Int = 0
    for move in moves {
        for i in 0..<boards.count {
            let item: Int = boards[i][move-1]
            if item > 0 {
                if !basket.isEmpty && item == basket[basket.count-1] {
                    basket.popLast()
                    answer += 2
                } else {
                    basket.append(item)
                }
                boards[i][move-1] = 0
                break
            }
        }
    }
    return answer
}

/// - [1차] 비밀지도
/// - https://programmers.co.kr/learn/courses/30/lessons/17681?language=swift
func solution17681(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2)
        .map { String(($0|$1), radix: 2) }
        .map { String(repeating: " ", count: n-$0.count) + $0.map { $0 == "1" ? "#" : " " } }
}

/// - 실패율
/// - https://programmers.co.kr/learn/courses/30/lessons/42889?language=swift
func solution42889_V1(_ N:Int, _ stages:[Int]) -> [Int] { //시간초과
    var failureRate: [Double] = []
    var stageCount: Int = stages.count
    
    for num in 1...N {
        let currentCount = stages.filter { $0 == num }.count
        failureRate.append(Double(currentCount) / Double(stageCount))
        stageCount -= currentCount
    }
    
    return failureRate.enumerated().sorted{ $1.element < $0.element }.map { $0.offset+1 }
}
func solution42889_V2(_ N:Int, _ stages:[Int]) -> [Int] {
    var failures: [(count: Int, rate: Double)] = Array(repeating: (0, 0), count: N)
    
    for i in 0..<stages.count {
        let idx = stages[i] - 1
        if idx < N {
            failures[idx].count += 1
        }
    }
    
    var stageCount: Int = stages.count
    for i in 0..<failures.count {
        let failCount: Int = failures[i].count
        failures[i].rate = failCount > 0 ? Double(failCount) / Double(stageCount) : 0
        stageCount -= failCount
    }
    
    return failures.enumerated()
        .sorted{ $0.element.rate > $1.element.rate }
        .map{ $0.offset+1 }
}

/// - [1차] 다트 게임
/// - https://programmers.co.kr/learn/courses/30/lessons/17682
func solution17682(_ dartResult:String) -> Int {
    var scores: [Int] = [Int](repeating: 0, count: 3)
    
    var idx: Int = -1
    var beforeChar: Character = " "
    for char in dartResult {
        switch char {
        case "0"..."9":
            if beforeChar == "1" {
                scores[idx] = 10
            } else {
                idx += 1
                scores[idx] = Int(String(char))!
            }
        case "D":
            scores[idx] = scores[idx] * scores[idx]
        case "T":
            scores[idx] = scores[idx] * scores[idx] * scores[idx]
        case "*":
            if idx < 1 {
                scores[idx] *= 2
            } else {
                scores[idx-1] *= 2
                scores[idx] *= 2
            }
        case "#":
            scores[idx] *= -1
        default:
            break
        }
        beforeChar = char
    }
    
    return scores.reduce(0, +)
}

/// - [카카오 인턴] 키패드 누르기
/// - https://programmers.co.kr/learn/courses/30/lessons/67256?language=swift
func solution67256(_ numbers:[Int], _ hand:String) -> String {
    let keypad: [[Int]] = [[1,4,7,-1], [2,5,8,0], [3,6,9,-1]]
    var leftHands: (position: String, keyIndex: Int) = ("L", 3)
    var rightHands: (position: String, keyIndex: Int) = ("R", 3)
    
    var hands: String = ""
    for key in numbers {
        switch key {
        case 1, 4, 7:
            leftHands = ("L", keypad[0].firstIndex(of: key)!)
            hands += "L"
        case 3, 6, 9:
            rightHands = ("R", keypad[2].firstIndex(of: key)!)
            hands += "R"
        default:
            let midKeyIndex: Int = keypad[1].firstIndex(of: key)!
            var leftDist = abs(leftHands.keyIndex - midKeyIndex)
            var rightDist = abs(rightHands.keyIndex - midKeyIndex)
            leftDist = leftHands.position == "M" ? leftDist - 1 : leftDist
            rightDist = rightHands.position == "M" ? rightDist - 1 : rightDist
            
            var midHand: String = ""
            if leftDist < rightDist {
                midHand = "L"
            } else if leftDist > rightDist {
                midHand = "R"
            } else {
                midHand = hand == "left" ? "L" : "R"
            }
            
            if midHand == "L" {
                leftHands = ("M", midKeyIndex)
            } else {
                rightHands = ("M", midKeyIndex)
            }
            
            hands += midHand
        }
    }
    
    return hands
}


/// - 피보나치 수
/// - https://programmers.co.kr/learn/courses/30/lessons/12945?language=swift
func solution12945(_ n:Int) -> Int {
    var f1: Int = 0
    var f2: Int = 1
    
    if n > 1 {
        for _ in 2...n {
            let f = f1 + f2
            f1 = f2
            f2 = f % 1234567
        }
    }
    
    return f2
}

