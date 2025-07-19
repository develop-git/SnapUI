//
//  ExtraStructs.swift
//  SnapUI
//
//  Created by jian on 2023/9/19.
//

//import Foundation

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    struct EdgeInsets {
        
        public var top: CombinedLiteral
        public var left: CombinedLiteral
        public var bottom: CombinedLiteral
        public var right: CombinedLiteral
        
        public init() {
            self.init(.all, 0)
        }
        
        public init(horizontal: CombinedLiteral, vertical: CombinedLiteral) {
            self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
        }
        
        public init(len: CombinedLiteral = 0.0) {
            self.init(top: len, left: len, bottom: len, right: len)
        }

        public init(top: CombinedLiteral, left: CombinedLiteral, bottom: CombinedLiteral, right: CombinedLiteral) {
            self.top = top
            self.bottom = bottom
            self.left = left
            self.right = right
        }
        
        public init(_ edge: RectEdge, _ len: CombinedLiteral) {
            self.top = edge.contains(.top) ? len : 0.0
            self.bottom = edge.contains(.bottom) ? len : 0.0
            self.left = edge.contains(.left) ? len : 0.0
            self.right = edge.contains(.right) ? len : 0.0
        }
    }

    struct RectEdge : OptionSet {
        public var rawValue: UInt

        public init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        public static var top: RectEdge { RectEdge(rawValue: 1 << 0) }
        
        public static var left: RectEdge { RectEdge(rawValue: 1 << 1) }

        public static var bottom: RectEdge { RectEdge(rawValue: 1 << 2) }

        public static var right: RectEdge { RectEdge(rawValue: 1 << 3) }

        public static var all: RectEdge { RectEdge(rawValue: 15) }
        
        public static var untop: RectEdge { [.left, .bottom, .right] }
        
        public static var unleft: RectEdge { [.top, .bottom, .right] }
        
        public static var unbottom: RectEdge { [.top, .left, .right] }
        
        public static var unright: RectEdge { [.top, .left, .bottom] }
        
        public static var horizontal: RectEdge { [.left, .right] }
        
        public static var vertical: RectEdge { [.top, .bottom] }
    }
}


