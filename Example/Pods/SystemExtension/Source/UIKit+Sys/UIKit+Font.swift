//
//  UIFont.swift
//  Foundation+Extra
//
//  Created by jian on 2023/4/21.
//



// MARK: ----- UIFont ------
public extension UIFont {
    
    static func system(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        UIFont.boldSystemFont(ofSize: size)
    }
}
