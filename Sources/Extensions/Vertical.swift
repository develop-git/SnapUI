//
//  SnapKit+vertical.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//


// MARK: 垂直
@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【上下边距，默认 10 】
    @discardableResult
    func vertical(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        return self.top(offset)
            .bottom(offset)
    }
    
    /// 【上下边距，默认 10 】
    @discardableResult
    func safevertical(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        return safeTop(offset)
            .safeBottom(offset)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vertical(_ top: CombinedLiteral,
              _ bottom: CombinedLiteral) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右安全边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func safevertical(_ top: CombinedLiteral,
                  _ bottom: CombinedLiteral) -> Self
    {
        return safeTop(top)
            .safeBottom(bottom)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vertical(_ top: YaxisOffset,
              _ bottom: YaxisOffset) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vertical(by view: AppView,
              top: CombinedLiteral = nil,
              bottom: CombinedLiteral = nil) -> Self
    {
        return self.top(by: view.lyt.top, offset: top)
            .bottom(by: view.lyt.bottom, offset: bottom)
    }
}
