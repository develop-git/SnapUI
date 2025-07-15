//
//  URL+Exts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/7/13.
//

import Foundation

public protocol URLCompatible {
    var value: URL? {get}
}

extension String: URLCompatible {
    public var value: URL? {
        return self.toURL()
    }
}

extension URL: URLCompatible {
    public var value: URL? {
        return self
    }
}

public extension String {
    func toURL() -> URL? {
        URL(string: self)
    }
}

public extension URL {
    static let baidu = "https://www.baidu.com"
    static let google = "https://www.google.com"
    static let github = "https://www.github.com"
}
