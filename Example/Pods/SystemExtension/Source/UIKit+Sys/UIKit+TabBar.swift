//
//  UITabBar+Exts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/4/21.
//
#if os(iOS)

public extension UITabBar {
    func index(of barItem: UITabBarItem?) -> Int? {
        guard let item = barItem else { return nil }
        return self.items?.firstIndex(of: item)
    }
    
    func imageView(of index: Int?) -> UIImageView? {
        guard let index = index else { return nil }
        return self.subviews(of: "UITabBarSwUIableImageView")?.at(index) as? UIImageView
    }
    
    func label(of index: Int?) -> UILabel? {
        guard let index = index else { return nil }
        return self.subviews(of: "UITabBarButtonLabel")?.at(index) as? UILabel
    }
}
#endif
