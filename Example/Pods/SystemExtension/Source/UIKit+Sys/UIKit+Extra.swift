//
//  UIKit+Extra.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public struct UIKitSetting<Base> {
    let base: Base
    init(_ base: Base) { self.base = base }
}

public protocol UIKitSettingCompatible {}
public extension UIKitSettingCompatible {
    static var set: UIKitSetting<Self>.Type {
        get { UIKitSetting<Self>.self }
        set {}
    }
    var set: UIKitSetting<Self> {
        get { UIKitSetting(self) }
        set {}
    }
}

extension UIView : UIKitSettingCompatible {}
extension UIViewController : UIKitSettingCompatible {}


