//
//  AppView+Snapkit.swift
//  SnapUI
//
//  Created by by jian on 2023/4/13.
//

#if os(iOS)
import UIKit
public typealias AppView = UIView
#elseif os(macOS)
import AppKit
public typealias AppView = NSView
#endif

@available(iOS 11.0, macOS 11.0, *)
public extension AppView {
    var lyt: SnapViewDSL {
        return layoutDSL!
    }
}

@available(iOS 11.0, macOS 11.0, *)
public extension Array where Element: AppView {
    var lyt: SnapViewsDSL {
        return SnapViewsDSL(array: self)
    }
}

@available(iOS 11.0, macOS 11.0, *)
public extension AppView {
   
    /// 覆盖在视图之上，并返回布局对象
    @discardableResult
    func add(to view: AppView) -> SnapViewDSL {
        if self != view {
            // 避免 lab.addSubview(lab) 情形
            view.addSubview(self)
        }
        return self.lyt
    }
    
    /// 移除自动布局所有约束，先前设置的约束将不再生效
    @discardableResult
    func removeConstraints() -> Self {
        self.snp.removeConstraints()
        self.layoutDSL = nil
        return self
    }
}

@available(iOS 11.0, macOS 11.0, *)
public extension Array where Element : AppView {
    
    /// 覆盖在视图之上，并返回布局对象
    @discardableResult
    func add(to view: AppView) -> SnapViewsDSL {
        self.forEach { sub in
            // 避免 lab.addSubview(lab) 情形
            guard sub != view else { return }
            view.addSubview(sub)
        }
        return self.lyt
    }
    
    /// 清除约束
    @discardableResult
    func removeConstraints() -> Self {
        self.forEach { $0.removeConstraints() }
        return self
    }
}

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 是否在对应方向上进行压缩
    @discardableResult
    func compress(_ compress: Bool = true, for axis: ViewCompressPriority.CompressAxis = .horizontal) -> Self {
        let pr = ViewCompressPriority.compress(compress, for: axis)
        view.setContentCompressionResistancePriority(pr.raw.priority, for: pr.raw.axis)
        return self
    }

    /// 压缩策略，优先展示优先级高的视图
    @discardableResult
    func priority(_ priority: ViewCompressPriority) -> Self {
        view.setContentCompressionResistancePriority(priority.raw.priority, for: priority.raw.axis)
        return self
    }
}
