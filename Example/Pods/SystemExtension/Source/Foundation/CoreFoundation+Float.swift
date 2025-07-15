//
//  CFExtensions.swift
//  Foundation+Extra
//
//  Created by jian on 2023/1/17.
//

import Foundation

public extension CGFloat {
    var range: ClosedRange<CGFloat> {
        return self...self
    }
}

public extension CGFloat {
    
    var safeVal: CGFloat {
        return self == CGFLOAT_MIN ? 0 : self
    }
    
    func decimal(precision: Int = 2) -> CGFloat {
        let tempCount: Self = CGFloat(pow(CGFloat(10), CGFloat(precision)))
        let temp = self * tempCount
        let target = Self(Int(temp))
        let step = target / tempCount
        return step
    }
   
    /**
     *  调整给定的某个 CGFloat 值的小数点精度，超过精度的部分按四舍五入处理。
     *
     *  例如 floatFixed(0.3333, 2) 会返回 0.33，而 floatFixed(0.6666, 2) 会返回 0.67
     */
    func floatFixed(precision: Int) -> CGFloat {
        let format = ("%.\(precision)f") as NSString
        let toStr = NSString(format: format, self)
        let val = CGFloat(toStr.floatValue)
        return val
    }

    /// 是否在区间内
    /// - Parameters:
    ///   - equal: 该值是否可与最大/最小值相等
    @discardableResult
    func `in`(_ range: ClosedRange<CGFloat>, equal: Bool = true) -> Bool {
        if equal {
            return range.lowerBound <= self && self <= range.upperBound
        }
        return range.lowerBound < self && self < range.upperBound
    }
}

public extension CGFloat {
    /// 返回 计算出的 grid 布局视图 width
    /// - Parameters:
    ///   - config: 计算配置
    static func gridItemWidth(column: Int, space: CGFloat, superWidth: CGFloat) -> CGFloat {
        if column < 2 {return superWidth}
        return ((superWidth - (space * CGFloat(column - 1))) / CGFloat(column))
    }
}

public extension Float {
    /// 是否在区间内
    /// - Parameters:
    ///   - equal: 该值是否可与最大/最小值相等
    @discardableResult
    func `in`(_ range: ClosedRange<Float>, equal: Bool = true) -> Bool {
        if equal {
            return range.lowerBound <= self && self <= range.upperBound
        }
        return range.lowerBound < self && self < range.upperBound
    }
}

public extension Double {
    /// 是否在区间内 默认: [0, 100]
    ///   - equal: 该值是否可与最大/最小值相等
    @discardableResult
    func `in`(_ range: ClosedRange<Double>, equal: Bool = true) -> Bool {
        if equal {
            return range.lowerBound <= self && self <= range.upperBound
        }
        return range.lowerBound < self && self < range.upperBound
    }
    
    var range: ClosedRange<CGFloat> {
        return CGFloat(self)...CGFloat(self)
    }
}


