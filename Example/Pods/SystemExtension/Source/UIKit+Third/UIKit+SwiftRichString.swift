//
//  SwiftRichString+Exts.swift
//  OnlineService
//
//  Created by 李健 on 2023/3/24.
//

#if canImport(SwiftRichString)
import SwiftRichString

public extension UIKitSetting where Base : Style {
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.base.font = font
        return self
    }
    @discardableResult
    func color(_ color: UIColor) -> Self {
        self.base.color = color
        return self
    }
    
    @discardableResult
    func backColor(_ color: UIColor) -> Self {
        self.base.backColor = color
        return self
    }
    
    @discardableResult
    func underline(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        self.base.underline = (style, color)
        return self
    }
    
    @discardableResult
    func strikethrough(style: NSUnderlineStyle = .single, color: UIColor? = nil) -> Self {
        self.base.strikethrough = (style, color)
        return self
    }
    
    @discardableResult
    func shadow(_ shadow: NSShadow?) -> Self {
        self.base.shadow = shadow
        return self
    }
    
    @discardableResult
    func stroke(width: Float?, color: UIColor?) -> Self {
        self.base.stroke = (color, width)
        return self
    }
}
#endif
