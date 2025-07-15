//
//  SwiftExts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/1/17.
//

import Foundation



public extension Bool {
    
    @discardableResult
    func `true`<T>(_ action: ()->T?) -> T? {
        return self == true ? action() : nil
    }
    
    @discardableResult
    func `true`<T>(_ value: T?) -> T? {
        return self == true ? value : nil
    }
    
    @discardableResult
    func `false`<T>(_ action: ()->T?) -> T? {
        return self == false ? action() : nil
    }
    
    @discardableResult
    func `false`<T>(_ value: T?) -> T? {
        return self == false ? value : nil
    }
    
    func `do`(true atrue:(()->Void)?, false afalse:(()->Void)?) {
        _ = self == true ? atrue?() : afalse?()
    }
}
