//
//  Swift+Array.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension Array {
    @discardableResult
    func at(_ index: Int?) -> Element? {
        guard let index = index else { return nil }
        return isSafe(at: index) ? self[index] : nil
    }
    
    @discardableResult
    mutating func removeAt(_ index: Int?) -> Element? {
        guard let index = index, isSafe(at: index) else { return nil }
        return self.remove(at: index)
    }
    
    mutating func insert(_ element: Element, atIndex: Int?) {
        guard let index = atIndex, isSafe(at: index) else { return }
        return self.insert(element, at: index)
    }
    
    func isSafe(at index: Int) -> Bool {
        if (startIndex..<endIndex).contains(index) {
            return true
        }
        return false
    }
    
    subscript(at index: Int) -> Element? {
        if isSafe(at: index) {
            return self[index]
        }
        return nil
    }
}

public extension Array {
    struct FoundationEnumeratedRefer {
        var isfirst: Bool = true
        var islast: Bool = true
        var refer: Element?
        init(isfirst: Bool, islast: Bool, refer: Element?) {
            self.isfirst = isfirst
            self.islast = islast
            self.refer = refer
        }
    }
    
    typealias FoundationEnumeratedBlock = (_ index: Int, _ elmt: Element, _ emRef: FoundationEnumeratedRefer, _ arr: Array<Element>, _ stop: inout Bool)->Void
    typealias FoundationEnumeratedGridBlock = (_ index: Int, _ elmt: Element, _ prev: Element?, _ row: FoundationEnumeratedRefer, _ col: FoundationEnumeratedRefer, _ arr: Array<Element>, _ stop: inout Bool)->Void
    
    /// 数组遍历
    func enumeratedAll(_ enumerate: FoundationEnumeratedBlock) {
        
        guard count > 0 else { return }
        
        let arr = self
        var prev: Element?
        var stop = false
        
        for (i,e) in arr.enumerated() {
            if stop { break }
            
            let emrt = FoundationEnumeratedRefer(isfirst: i == 0, islast: i == count - 1, refer: prev)
            enumerate(i, e, emrt, arr, &stop)
            
            prev = e
        }
    }
    
    /// 数组遍历
    func enumeratedFrom(start startIndex: Int, enumerate: FoundationEnumeratedBlock) {
        
        guard count > 0 else { return }
        
        let arr = self
        var prev: Element?
        var stop = false
        
        for (i,e) in arr.enumerated() where i >= startIndex {
            if stop { break }
            
            let emrt = FoundationEnumeratedRefer(isfirst: i == 0, islast: i == count - 1, refer: prev)
            enumerate(i, e, emrt, arr, &stop)
            
            prev = e
        }
    }
    
    /// 九宫格遍历
    func enumeratedGrid(colums: Int, enumerate: FoundationEnumeratedGridBlock) {
        
        guard count > 0 else { return }
        
        let arr = self
        let colums = Swift.min(count, Swift.max(colums, 2))
        let rows = count % colums == 0 ? count / colums : count / colums + 1
        
        var prev: Element?
        var stop = false
        
        for (i,e) in arr.enumerated() {
            if stop { break }
            
            let curRow = i / colums
            let curCol = i % colums
            
            let row = FoundationEnumeratedRefer(isfirst: curRow == 0, islast: curRow == rows - 1, refer: arr.at(i - colums))
            let col = FoundationEnumeratedRefer(isfirst: curCol == 0, islast: curCol == colums - 1, refer: curCol == 0 ? nil : prev)
            
            enumerate(i, e, prev, row, col, arr, &stop)
            
            prev = e
        }
    }
    
    /// 数组区间遍历
    func enumeratedRange(in range: ClosedRange<Int>, enumerate: FoundationEnumeratedBlock) {
        
        guard count > 0 else { return }
        
        let arr = self
        var stop = false
        var prev: Element?
        
        for (i,e) in arr.enumerated() where i.in(range) {
            if stop { break }
            let emrt = FoundationEnumeratedRefer(isfirst: i == range.lowerBound, islast: i == range.upperBound, refer: prev)
            enumerate(i, e, emrt, arr, &stop)
            
            prev = e
        }
    }
    
    /// 数组简单遍历
    func enumeratedSimple(_ enumerate: (_ index: Int, _ elmt: Element, _ arr: Array<Element>, _ stop: inout Bool)->Void) {
        
        guard count > 0 else { return }
        let arr = self
        var stop = false
        for (i,e) in self.enumerated() {
            if stop { break }
            enumerate(i, e, arr, &stop)
        }
    }
}

public extension Array where Element : Hashable {
    var unique: [Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
}
