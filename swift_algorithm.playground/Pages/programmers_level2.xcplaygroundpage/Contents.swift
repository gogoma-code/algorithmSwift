import Foundation

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

/// - 큰 수 만들기
/// - https://programmers.co.kr/learn/courses/30/lessons/42883?language=swift
func solution42883(_ number:String, _ k:Int) -> String {
    var k = k
    var numbers: [String] = []
    
    for (idx, ele) in number.enumerated() {
        let el = String(ele)
        while k > 0, !numbers.isEmpty, numbers.last! < el {
            numbers.removeLast()
            k -= 1
        }
        
        if k > 0 {
            numbers.append(el)
        } else {
            numbers.append(contentsOf: number[number.index(number.startIndex, offsetBy: idx)...].map{ String($0) })
            break
        }
    }
    
    let idx = numbers.index(numbers.startIndex, offsetBy: numbers.count - k)
    return numbers[..<idx].joined()
}

/// - 최댓값과 최솟값
/// - https://programmers.co.kr/learn/courses/30/lessons/12939?language=swift
func solution12939(_ s:String) -> String {
    let ansArr: [Int] = s.split(separator: " ").compactMap{ Int($0) }.sorted{ $0 < $1 }
    return "\(ansArr[0]) \(ansArr[ansArr.count-1])"
}

/// - N개의 최소공배수
/// - https://programmers.co.kr/learn/courses/30/lessons/12953?language=swift
/*
func solution12953_V1(_ arr:[Int]) -> Int {
    var lcmVal: Int = arr[0]
    for i in 1..<arr.count {
        lcmVal = lcm(lcmVal, arr[i])
    }
    return lcmVal
}
func solution12953_V2(_ arr:[Int]) -> Int {
    return arr.reduce(1, {lcm($0, $1)})
}
func gcd(_ n:Int, _ m:Int) -> Int {
    return m == 0 ? n : gcd(m, n % m)
}
func lcm(_ n:Int, _ m:Int) -> Int {
    return n * m / gcd(n, m)
}
*/

/// - 최솟값 만들기
/// - https://programmers.co.kr/learn/courses/30/lessons/12941?language=swift
func solution12941_V1(_ A:[Int], _ B:[Int]) -> Int
{
    let orderA: [Int] = A.sorted()
    let orderB: [Int] = B.sorted()
    
    var ans: Int = 0
    for i in 0..<orderA.count {
        ans += orderA[i] * orderB[orderB.count-1-i]
    }
    
    return ans
}
func solution12941_V2(_ A:[Int], _ B:[Int]) -> Int
{
    return zip(A.sorted(), B.sorted{ $0 > $1 }).map{ $0 * $1 }.reduce(0, +)
}

/// - 행렬의 곱셈
/// - https://programmers.co.kr/learn/courses/30/lessons/12949?language=swift
func solution12949(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            for k in 0..<arr1[i].count {
                arr[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    
    return arr
}

/// - H-Index
/// - https://programmers.co.kr/learn/courses/30/lessons/42747?language=swift
func solution42747(_ citations:[Int]) -> Int {
    let sorted: [Int] = citations.sorted()
    var maxVal: Int = 0
    for i in stride(from: sorted.count-1, through: 0, by: -1) {
        maxVal = max(maxVal, min(sorted[i], sorted.count-i))
    }
    return maxVal
}

/// - 다음 큰 숫자
/// - https://programmers.co.kr/learn/courses/30/lessons/12911?language=swift
func solution12911_V1(_ n:Int) -> Int {
    let oneCount: Int = String(n, radix: 2).filter {$0 == "1"}.count
    var num: Int = n + 1
    while oneCount != String(num, radix: 2).filter({$0 == "1"}).count {
        num += 1
    }
    
    return num
}
func solution12911_V2(_ n:Int) -> Int {
    var num: Int = n + 1
    while n.nonzeroBitCount != num.nonzeroBitCount {
        num += 1
    }
    
    return num
}

/// - 위장
/// - https://programmers.co.kr/learn/courses/30/lessons/42578?language=swift
func solution42578_V1(_ clothes:[[String]]) -> Int {
    var clothDic: [String:Int] = [:]
    for cloth in clothes {
        clothDic.updateValue((clothDic[cloth[1]] == nil ? 1 : clothDic[cloth[1]]! + 1), forKey: cloth[1])
    }

    var answer: Int = 1
    for value in clothDic.values {
        answer *= value + 1
    }
    return answer - 1
}
func solution42578_V2(_ clothes:[[String]]) -> Int {
    var clothDic: [String:Int] = [:]
    for cloth in clothes {
        clothDic.updateValue((clothDic[cloth[1]] == nil ? 2 : clothDic[cloth[1]]! + 1), forKey: cloth[1])
    }
    
    return clothDic.values.reduce(1, {$0 * $1}) - 1
}
func solution42578_V3(_ clothes:[[String]]) -> Int {
    let counts = Set(clothes.compactMap({ $0[1] })).map {category in
        return clothes.filter{$0[1] == category}.count + 1
    }
    
    return counts.reduce(1,  { $0 * $1 }) - 1
}

/// - 가장 큰 수
/// -  https://programmers.co.kr/learn/courses/30/lessons/42746?language=swift
func solution42746(_ numbers:[Int]) -> String {
    let answer: String = numbers.map{String($0)}.sorted {$0+$1 > $1+$0}.joined()
    return answer.first == "0" ? "0" : answer
}

/// - 스킬트리
/// - https://programmers.co.kr/learn/courses/30/lessons/49993?language=swift
func solution49993(_ skill:String, _ skill_trees:[String]) -> Int {
    var count = skill_trees.count
    
    for skills in skill_trees {
        var before: String.Index = skills.startIndex
        var beforeFlag: Bool = true
        for skillChar in skill {
            if let current = skills.firstIndex(of: skillChar) {
                if skills.distance(from: before, to: current) < 0 || !beforeFlag {
                    count -= 1
                    break
                }
                before = current
            } else {
                beforeFlag = false
            }
        }
    }
    
    return count
}

/// - 기능개발
/// - https://programmers.co.kr/learn/courses/30/lessons/42586?language=swift
func solution42586(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let workDays: [Int] = progresses.enumerated().map { (p) -> Int in
        let dayCnt = (100-p.element) / speeds[p.offset]
        return (100-p.element) % speeds[p.offset] == 0 ? dayCnt : dayCnt + 1
    }
    
    var distributeArr: [Int] = []
    var distributeCnt: Int = 0
    var workMax: Int = workDays.first!
    for i in 0..<workDays.count {
        if workMax < workDays[i] {
            distributeArr.append(distributeCnt)
            workMax = workDays[i]
            distributeCnt = 0
        }
        
        distributeCnt += 1
    }
    distributeArr.append(distributeCnt)
    
    return distributeArr
}

/// - 프린터
/// - https://programmers.co.kr/learn/courses/30/lessons/42587?language=swift
func solution42587(_ priorities:[Int], _ location:Int) -> Int {
    var priority: [(Int,Int)] = priorities.enumerated().map {($0.offset, $0.element)}
    var printing: Int = 0
    
    while !priority.isEmpty {
        let pri: (Int, Int) = priority.remove(at: 0)
        if !priority.filter({pri.1 < $0.1}).isEmpty {
            priority.append(pri)
        } else if pri.0 == location {
            printing = priorities.count - priority.count
            break
        }
    }
    
    return printing
}


