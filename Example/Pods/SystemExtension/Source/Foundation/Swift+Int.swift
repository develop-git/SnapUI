//
//  Swift+Int.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension Int {
    var range: ClosedRange<CGFloat> {
        return CGFloat(self)...CGFloat(self)
    }
}

public extension Int {
    /// 是否在区间内
    /// - Parameters:
    ///   - equal: 该值是否可与最大/最小值相等
    @discardableResult
    func `in`(_ range: ClosedRange<Int>, equal: Bool = true) -> Bool {
        if equal {
            return range.lowerBound <= self && self <= range.upperBound
        }
        return range.lowerBound < self && self < range.upperBound
    }
    
    func sizeFromKB() -> String {
        return (self*1024).sizeFromByte()
    }

    func sizeFromByte() -> String {
        return ByteCountFormatter.string(fromByteCount: Int64(self), countStyle: .file)
    }

    func memFormatted() -> String {
        let sign = ((self < 0) ? "-" : "" )
        if self < 1000 {
            return "\(sign)\(self)"
        }
        let num = fabs(Double(self))
        let exp: Int = Int(log10(num) / 3.0 ) //log10(1000))
        let units: [String] = ["K", "M", "G", "T", "P", "E"]
        let roundedNum: Double = round(10 * num / pow(1000.0, Double(exp))) / 10
        return "\(sign)\(roundedNum)\(units[exp-1])"
    }
    
    func isLast(of count: Int) -> Bool {
        self == (count - 1)
    }
}
