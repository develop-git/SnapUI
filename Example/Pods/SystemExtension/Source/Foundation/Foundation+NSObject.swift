//
//  NSObject+Exts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/7/7.
//

import Foundation

//public extension NSObject {
//    func objc_set(_ obj: Any?, forKey key: inout String) {
//        objc_setAssociatedObject(self, &key, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
//    func objc_get(forKey key: inout String) -> Any? {
//        objc_getAssociatedObject(self, &key)
//    }
//}

public extension NSObject {
    var className: String {
        let name = type(of: self).description()
        if name.contains(".") {
            return name.components(separatedBy: ".")[1]
        } else {
            return name
        }
    }
}

