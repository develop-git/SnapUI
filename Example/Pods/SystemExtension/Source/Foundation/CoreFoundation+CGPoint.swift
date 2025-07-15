//
//  CoreFoundation+CGPoint.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension CGPoint {
    
    init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    
    static func center(_ p1: CGPoint, _ p2: CGPoint) -> CGPoint {
        CGPoint(x: (p1.x + p2.x) * 0.5, y: (p1.y + p2.y) * 0.5)
    }
}
