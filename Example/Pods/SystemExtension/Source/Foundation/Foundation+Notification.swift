//
//  Notification+Exts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/7/13.
//

import Foundation

// MARK: 通知中心
public extension Notification.Name {
#if os(iOS)
    /// 屏幕旋转
    static let screenRotation = UIApplication.didChangeStatusBarOrientationNotification
#endif
    
    /// 开始活动
    static let applicationBecomeActive = UIApplication.didBecomeActiveNotification
}

public extension NotificationCenter {
    /// 通知中心监听
    static func post(for name: Notification.Name, object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    
    /// 通知中心监听
    static func listen(for name: Notification.Name, target: Any, selector: Selector, object: Any? = nil) {
        NotificationCenter.default.addObserver(target, selector: selector, name: name, object: object)
    }
    
    static func listen(for name: Notification.Name, action: @escaping (Notification)->Void) {
        NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: action)
    }
    
    static func remove(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    static func remove(_ observer: Any, name: NSNotification.Name?) {
        NotificationCenter.default.removeObserver(observer, name: name, object: nil)
    }
}

#if canImport(RxSwift)
import RxSwift

public extension NotificationCenter {
    
    /// 通知中心监听
    static func rxlisten(for name: Notification.Name, onNext:@escaping(_ notification: Notification) -> Void) -> Disposable {
        return NotificationCenter.default.rx
            .notification(name)
            .subscribe(onNext: onNext)
    }
}
#endif
