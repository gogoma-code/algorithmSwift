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

/// - 문자열 압축
/// - https://programmers.co.kr/learn/courses/30/lessons/60057?language=swift
func solution60057(_ s:String) -> Int {
    let sArr: [String] = s.map {String($0)}
    var comStr: String = s
    
    for modZero in 1..<sArr.count {
        var idx: Int = 0
        var val: (count: Int, str: String) = (1, "")
        var tmpStr: String = ""
        
        while idx < sArr.count {
            let cur: String = idx+modZero < sArr.count ? sArr[idx..<idx+modZero].joined() : sArr[idx..<sArr.count].joined()
            if cur == val.str {
                val.count = val.count + 1
            } else {
                tmpStr += (val.count > 1 ? String(val.count) : "") + val.str
                val = (1, cur)
            }
            idx += modZero
        }
        tmpStr += (val.count > 1 ? String(val.count) : "") + val.str
        comStr = tmpStr.count < comStr.count ? tmpStr : comStr
    }
    
    return comStr.count
}

/// - 오픈채팅방
/// - https://programmers.co.kr/learn/courses/30/lessons/42888?language=swift
func solution42888(_ record:[String]) -> [String] {
    var result: [(String, String)] = []
    var nicknames: [String:String] = [:]
    
    for r in record {
        let rSplit = r.split(separator: " ")
        let re = (String(rSplit[0]), String(rSplit[1]))
        
        switch re.0 {
        case "Enter":
            result.append((re.1, "님이 들어왔습니다."))
            nicknames.updateValue(String(rSplit[2]), forKey: re.1)
            break
        case "Change":
            nicknames.updateValue(String(rSplit[2]), forKey: re.1)
            break
        case "Leave":
            result.append((re.1, "님이 나갔습니다."))
            break
        default:
            break
        }
    }
    
    return result.map { nicknames[$0.0]! + $0.1 }
}

/// - 다리를 지나는 트럭
/// - https://programmers.co.kr/learn/courses/30/lessons/42583?language=swift
func solution42583(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var timesAndWeights: [(Int, Int)] = []
    var i: Int = 0, sum: Int = 0, time: Int = 0
    while true {
        if !timesAndWeights.isEmpty && timesAndWeights.first!.1 == time {
            sum = sum - timesAndWeights.removeFirst().0
        }
        
        if i < truck_weights.count && sum + truck_weights[i] <= weight {
            sum += truck_weights[i]
            timesAndWeights.append((truck_weights[i], time + bridge_length))
            i += 1
        }
        
        time += 1
        if timesAndWeights.isEmpty { break }
    }
    
    return time
}

/// - 타겟 넘버
/// - https://programmers.co.kr/learn/courses/30/lessons/43165?language=swift
func solution43165_V1(_ numbers:[Int], _ target:Int) -> Int {
    func dfs(_ node: Int, _ sum: Int) -> Int {
        if(node == numbers.count) { return sum == target ? 1 : 0}
        return dfs(node+1, sum + numbers[node]) + dfs(node+1, sum - numbers[node])
    }
    
    return dfs(0, 0)
}
func solution43165_V2(_ numbers:[Int], _ target:Int) -> Int {
    func bfs() -> Int {
        var answer: Int = 0
        var tupleAry: [(Int, Int)] = []
        tupleAry.append((numbers[0], 0))
        tupleAry.append((-numbers[0], 0))
        
        while(!tupleAry.isEmpty) {
            let tuple: (Int, Int) = tupleAry.removeFirst()
            if tuple.1 == numbers.count-1 {
                if tuple.0 == target { answer += 1 }
            } else {
                tupleAry.append((tuple.0 + numbers[tuple.1 + 1], tuple.1 + 1))
                tupleAry.append((tuple.0 - numbers[tuple.1 + 1], tuple.1 + 1))
            }
        }
        
        return answer
    }
    
    return bfs()
}

/// - 소수 찾기
/// - https://programmers.co.kr/learn/courses/30/lessons/42839?language=swift
func solution42839(_ numbers:String) -> Int {
    var set: Set<Int> = []
    
    func permutation(_ prefix: String, _ str: String, _ set: inout Set<Int> ) {
        let len: Int = str.count
        if prefix != "" {
            set.insert(Int(prefix)!)
        }
        for i in 0..<len {
            let idx = str.index(str.startIndex, offsetBy: i)
            let idx2 = str.index(str.startIndex, offsetBy: i+1)
            permutation(prefix + String(str[idx]), String(str[str.startIndex..<idx]) + str[idx2..<str.endIndex], &set)
        }
    }
    func isPrime(_ num: Int) -> Bool {
        if num < 3 {
            return num == 2 ? true : false
        } else {
            for i in 2..<num {
                if num % i == 0 {
                    return false
                }
            }
        }
        return true
    }
    
    permutation("", numbers, &set)
    return set.filter{ isPrime($0) }.count
}

/// - 카펫
/// - https://programmers.co.kr/learn/courses/30/lessons/42842?language=swift
func solution42842(_ brown:Int, _ yellow:Int) -> [Int] {
    var y: Int = 3
    var x: Int = (brown + yellow) / y
    
    while true {
        if (x-2) * (y-2) == yellow {
            break
        }
        y += 1
        x = (brown + yellow) / y
    }
    
    return [x, y]
}

/// - 올바른 괄호
/// - https://programmers.co.kr/learn/courses/30/lessons/12909?language=swift
func solution12909(_ s:String) -> Bool {
    var cnt: Int = 0
    
    for char in s {
        switch char {
        case "(":
            cnt += 1
        case ")":
            cnt -= 1
        default:
            break
        }
        
        if cnt < 0 {
            break
        }
    }
    
    return cnt == 0
}

/// - 괄호 변환
/// - https://programmers.co.kr/learn/courses/30/lessons/60058?language=swift
func solution60058(_ p:String) -> String {
    func isCorrect(_ s:String) -> Bool {
        var cnt: Int = 0
        
        for char in s {
            switch char {
            case "(":
                cnt += 1
            case ")":
                cnt -= 1
            default:
                break
            }
            
            if cnt < 0 {
                break
            }
        }
        
        return cnt == 0
    }
    
    func conversion(_ w: String) -> String {
        if w == "" { return "" }
        
        var result: String = "", u: String = ""
        var cnt: Int = 0
        
        for i in 0..<w.count {
            let str: String = String(w[w.index(w.startIndex, offsetBy: i)])
            u += str
            switch str {
            case "(":
                cnt += 1
            case ")":
                cnt -= 1
            default:
                break
            }
            
            if cnt == 0 {
                let idx: String.Index = w.index(w.startIndex, offsetBy: i+1)
                let v: String = String(w[idx..<w.endIndex])
                if isCorrect(u) {
                    result += u
                    result += conversion(v)
                } else {
                    u = String(u[u.index(u.startIndex, offsetBy: 1)..<u.endIndex])
                    u = String(u[u.startIndex..<u.index(u.startIndex, offsetBy: u.count-1)])
                    u = u.replacingOccurrences(of: "(", with: "#")
                        .replacingOccurrences(of: ")", with: "(")
                        .replacingOccurrences(of: "#", with: ")")
                    result += "(" + conversion(v) + ")" + u
                }
                break
            }
        }
        
        return result
    }
    return conversion(p)
}

/// - [3차] n진수 게임
/// - https://programmers.co.kr/learn/courses/30/lessons/17687?language=swift
func solution17687(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var conversionResult: [Character] = []
    let tMulm: Int = t * m
    
    var num: Int = 0
    while conversionResult.count < tMulm {
        let radix = String(num, radix: n)
        radix.forEach { conversionResult.append($0) }
        num += 1
    }
    
    var answer: String = ""
    var i: Int = p-1
    while answer.count < t {
        answer.append(conversionResult[i])
        i += m
    }
    
    return answer.uppercased()
}

/// - JadenCase 문자열 만들기
/// - https://programmers.co.kr/learn/courses/30/lessons/12951?language=swift
func solution12951(_ s:String) -> String {
    let str: [String] = s.lowercased().map{String($0)}
    var answer: String = ""
    var flag: Bool = true
    for char in str {
        answer.append(flag ? char.uppercased() : char)
        flag = char == " " ? true : false
    }
    
    return answer
}

/// - 짝지어 제거하기
/// - https://programmers.co.kr/learn/courses/30/lessons/12973?language=swift
func solution12973(_ s:String) -> Int{
    var stack: [Character] = []
    for ch in s {
        if stack.isEmpty {
            stack.append(ch)
        } else {
            if stack.last! == ch {
                stack.popLast()
            } else {
                stack.append(ch)
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

/// - 가장 큰 정사각형 찾기
/// - https://programmers.co.kr/learn/courses/30/lessons/12905?language=swift
func solution12905(_ board:[[Int]]) -> Int {
    var boards = board
    var max: Int = 0, size: Int = 0
    for i in 0..<boards.count {
        for j in 0..<boards[i].count {
            if board[i][j] == 1 {
                size = 1
                if i != 0, j != 0 {
                    boards[i][j] = min(boards[i-1][j-1], min(boards[i-1][j], boards[i][j-1])) + 1
                    size = boards[i][j]
                }
                
                max = (max < size) ? size : max
            }
        }
    }
    
    return max * max
}

/// - 튜플
/// - https://programmers.co.kr/learn/courses/30/lessons/64065?language=swift
func solution64065(_ s:String) -> [Int] {
    let strAry = s.map { (c) -> String in
        if c == "{" || c == "}" { return " " }
        else { return String(c) }
    }.joined()
    .trimmingCharacters(in: .whitespaces)
    .components(separatedBy: " , ")
    .sorted{$0.count < $1.count}
    
    var set: Set<Int> = []
    var answer: [Int] = []
    for str in strAry {
        for strSplit in str.split(separator: ",") {
            if(set.insert(Int(strSplit)!).inserted) {
                answer.append(Int(strSplit)!)
            }
        }
    }
    
    return answer
}

/// - 영어 끝말잇기
/// - https://programmers.co.kr/learn/courses/30/lessons/12981?language=swift
func solution12981(_ n:Int, _ words:[String]) -> [Int] {
    var set: Set<String> = []
    var lastword: String = ""
    var cnt = 1
    for word in words {
        if !set.insert(word).inserted {
            break
        }
        if lastword != "", lastword.last! != word.first! {
            break
        }
        
        lastword = word
        cnt += 1
    }
    
    var num = 0, turn = 0
    if words.count != set.count {
        num = (cnt % n == 0) ? n : cnt % n
        turn = (cnt % n == 0) ? cnt / n : cnt / n + 1
    }
    
    return [num, turn]
}

/// - [1차] 캐시
/// - https://programmers.co.kr/learn/courses/30/lessons/17680?language=swift
func solution17680(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    var cache: [String] = []
    var time : Int = 0
    for city in cities.map({ String($0.lowercased()) }) {
        if let idx = cache.firstIndex(of: city) {
            cache.remove(at: idx)
            time += 1
        } else {
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
            time += 5
        }
        cache.append(city)
    }
    
    return time
}

/// - 멀쩡한 사각형
/// - https://programmers.co.kr/learn/courses/30/lessons/62048?language=swift
func solution62048(_ w:Int, _ h:Int) -> Int64{
    func gcd(_ n:Int64, _ m:Int64) -> Int64 {
        return m == 0 ? n : gcd(m, n % m)
    }
    
    let ww: Int64 = Int64(w)
    let hh: Int64 = Int64(h)
    return ww * hh - (ww + hh - gcd(ww, hh))
}

/// - [1차] 프렌즈4블록
/// - https://programmers.co.kr/learn/courses/30/lessons/17679?language=swift
func solution17679(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boards: [[String]] = []
    for b in board { boards.append(b.map{String($0)}) }
    var cnt: Int = 0
    
    while true {
        var flag: Bool = false
        var flagBoards: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i != 0, j != 0 {
                    let b: String = boards[i][j]
                    if(b != " " && b == boards[i-1][j-1] && b == boards[i-1][j] && b == boards[i][j-1]) {
                        flag = true
                        flagBoards[i][j] = true; flagBoards[i-1][j-1] = true;
                        flagBoards[i-1][j] = true; flagBoards[i][j-1] = true;
                    }
                }
            }
        }
        
        if !flag { break }
        
        for i in 0..<m {
            for j in 0..<n {
                if flagBoards[i][j] {
                    cnt += 1
                    for k in stride(from: i, through: 1, by: -1) {
                        boards[k][j] = boards[k-1][j]
                        boards[k-1][j] = " "
                    }
                }
            }
        }
    }
    
    return cnt
}

/// - 예상 대진표
/// - https://programmers.co.kr/learn/courses/30/lessons/12985?language=swift
func solution12985(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var ab: (a: Int, b: Int) = (a, b)
    var cnt: Int = 1
    while true {
        if (ab.a.isMultiple(of: 2) && ab.a - 1 == ab.b) || (!ab.a.isMultiple(of: 2) && ab.a + 1 == ab.b) {
            break
        }
        ab.a = ab.a % 2 == 0 ? ab.a / 2 : ab.a / 2 + 1
        ab.b = ab.b % 2 == 0 ? ab.b / 2 : ab.b / 2 + 1
        cnt += 1
    }
    
    return cnt
}

