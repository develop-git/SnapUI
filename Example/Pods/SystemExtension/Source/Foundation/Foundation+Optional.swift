//
//  Foundation+Optional.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension Optional {
    var isNone: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
    
    var isSome: Bool {
        return !isNone
    }
    
    func or(_ default: Wrapped) -> Wrapped {
        return self ?? `default`
    }
    
    func or(else: @autoclosure() -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
    
    func or(else: () -> Wrapped) -> Wrapped {
        return self ?? `else`()
    }
}
