//
//  QMUI+Exts.swift
//  OnlineService
//
//  Created by 李健 on 2023/3/2.
//

#if canImport(QMUIKit) && os(iOS)
import QMUIKit

public extension UINavigationBar {
    /// 可隐藏的导航栏animator
    @discardableResult
    static func snapScrollAnimator(bind scroll: UIScrollView) -> QMUINavigationBarScrollingSnapAnimator {
        let animator = QMUINavigationBarScrollingSnapAnimator()
        animator.scrollView = scroll
        return animator
    }
    
    @discardableResult
    static func opacityScrollAnimator(bind scroll: UIScrollView) -> QMUINavigationBarScrollingAnimator {
        let animator = QMUINavigationBarScrollingAnimator()
        animator.scrollView = scroll
        return animator
    }
}

public extension UIKitSetting where Base : QMUINavigationBarScrollingAnimator {
    
    /// 配置背景图片
    @discardableResult
    func backgroundImage(animation: @escaping(_ progress: CGFloat)->UIImage?) -> Self {
        self.base.backgroundImageBlock = {animator, progress -> UIImage in
            guard let img = animation(CGFloat(progress)) else { return
                .make(from: UIColor.clear)!
            }
            return img
        }
        return self
    }
    
    /// 配置状态栏
    @discardableResult
    func statusBarStyle(animation: @escaping(_ progress: CGFloat)->UIStatusBarStyle) -> Self {
        self.base.statusbarStyleBlock = {animator, progress -> UIStatusBarStyle in
            animation(CGFloat(progress))
        }
        return self
    }
    
    /// 获取状态栏设置
    func statusBarStyle() -> UIStatusBarStyle {
        let animator = self
        return self.base.statusbarStyleBlock?(animator, animator.progress) ?? .dark
    }
    
    @discardableResult
    func titleColor(animation: @escaping(_ progress: CGFloat)->UIColor) -> Self {
        self.base.titleViewTintColorBlock = {animator, progress -> UIColor in
            animation(CGFloat(progress))
        }
        return self
    }
    
    @discardableResult
    func itemsColor(animation: @escaping(_ progress: CGFloat)->UIColor) -> Self {
        self.base.tintColorBlock = {animator, progress -> UIColor in
            animation(CGFloat(progress))
        }
        return self
    }
    
    @discardableResult
    func startAnimated(_ offsetY: CGFloat) -> Self {
        self.base.offsetYToStartAnimation = offsetY
        return self
    }
    
    @discardableResult
    func stopAnimated(_ distance: CGFloat) -> Self {
        self.base.distanceToStopAnimation = distance
        return self
    }
}

public extension UIKitSetting where Base : QMUINavigationBarScrollingSnapAnimator {
    @discardableResult
    func animationAction(_ action: @escaping(_ isReach: Bool)->Void) -> Self {
        self.base.animationBlock = {animator, isReached in
            action(isReached)
        }
        return self
    }
    
    @discardableResult
    func startAnimated(_ offsetY: CGFloat) -> Self {
        self.base.offsetYToStartAnimation = offsetY
        return self
    }
}
#endif

