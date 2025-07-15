//
//  CoreFoundation+CGSize.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension CGSize {
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
    /// 返回 宽高相同的 size
    init(_ value: CGFloat) {
        self.init(width: value, height: value)
    }
    /// 判断一个 CGSize 是否存在 NaN
    var isNaN: Bool {
        return self.width.isNaN || self.height.isNaN
    }
    /// 判断一个 CGSize 是否存在 infinite
    var isInf: Bool {
        return self.width.isInfinite || self.height.isInfinite
    }

    /// 判断一个 CGSize 是否为空（宽或高为0）
    var isEmpty: Bool {
        return self.width <= 0 || self.height <= 0
    }
    
    /// 判断一个 CGSize 是否合法（例如不带无穷大的值、不带非法数字）
    var isValidated: Bool {
        return !self.isEmpty && !self.isInf && !self.isNaN
    }
    func min() -> CGFloat {
        Swift.min(self.width, self.height)
    }
}

public extension CGSize {
    /// 返回 水平方向 屏幕宽度最大值 size
    /// - Parameters:
    ///   - add: 增加量（add<0, 减少，add>0, 增加）默认：10
    ///   - height: 确定高度
    ///   - mult: 缩放比例值 默认 1.0
    static func dynaMaxHorz(height: CGFloat, add: CGFloat = 10, mult: CGFloat = 1) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        return CGSize(width: width * mult + add, height: height)
    }
    /// 返回 垂直方向 屏幕高度最大值 size
    /// - Parameters:
    ///   - add: 增加量（add<0, 减少，add>0, 增加）默认：10
    ///   - width: 确定宽度
    ///   - mult: 缩放比例值 默认 1.0
    static func dynaMaxVert(width: CGFloat, add: CGFloat = 10, mult: CGFloat = 1) -> CGSize {
        let height = UIScreen.main.bounds.size.height
        return CGSize(width: width, height: height * mult + add)
    }
}

extension CGSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = CGSize(width: CGFloat(value), height: CGFloat(value))
    }
    public init(floatLiteral value: FloatLiteralType) {
        self = CGSize(width: CGFloat(value), height: CGFloat(value))
    }
}
