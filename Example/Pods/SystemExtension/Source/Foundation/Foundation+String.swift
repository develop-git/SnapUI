//
//  Foundation+String.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension String {
    
    var oc: NSString {
        get { self as NSString}
    }
    
    func isSafe(at index: Int) -> Bool {
        if self.isEmpty {
            return false
        }
        if (0...count).contains(index) {
            return true
        }
        return false
    }
    
    @discardableResult
    func substring(from index: Int) -> String? {
        guard self.isSafe(at: index) else {return nil}
        return (self as NSString).substring(from: index)
    }
    
    @discardableResult
    func substring(to index: Int) -> String? {
        guard self.isSafe(at: index) else {return nil}
        return (self as NSString).substring(to: index)
    }
    
    @discardableResult
    func substring(from start: Int, to end: Int) -> String? {
        guard self.isSafe(at: start), self.isSafe(at: end) else {return nil}
        return (self as NSString).substring(with: NSRange(location: start, length: end - start))
    }
    
    @discardableResult
    func substring(from start: Int, len: Int) -> String? {
        guard self.isSafe(at: start), self.isSafe(at: start + len) else {return nil}
        return (self as NSString).substring(with: NSRange(location: start, length: len))
    }
}

public extension String {
    var attri: NSAttributedString {
        get { NSAttributedString(string: self) }
    }
    var mutAttri: NSMutableAttributedString {
        get { NSMutableAttributedString(string: self) }
    }
}

public extension NSString {
    var swift: String {
        get {self as String}
    }
}
