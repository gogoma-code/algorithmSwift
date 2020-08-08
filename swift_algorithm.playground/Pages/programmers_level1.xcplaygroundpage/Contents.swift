import SwiftUI

func solution12918(_ s:String) -> Bool {
    guard let _: Int = Int(s), (s.count == 4 || s.count == 6) else {
        return false
    }
    return true
}

solution12918("123")
solution12918("123a")
solution12918("1234")
