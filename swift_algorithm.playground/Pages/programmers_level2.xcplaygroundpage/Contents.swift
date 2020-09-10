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
func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
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

