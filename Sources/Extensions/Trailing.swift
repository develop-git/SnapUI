//
//  SnapKit+Trailing.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//


// MARK: trailing

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 【右边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func trailing(_ offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    @discardableResult
    func trailing(_ offset: XaxisOffset) -> Self {
        guard let ret = verify(at: .trailing, from: offset.raw.item, extra: offset.raw.offset.invertVal, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeTrailing(_ offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右边距】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func safeTrailing(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeTrailing(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.safeTrailing, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右中边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingCenterY(_ trailing: XaxisOffset,
                         _ centerY: YaxisOffset? = nil) -> Self
    {
        guard let centerY = centerY else {
            return self.trailing(trailing)
                .centerY(by: trailing.raw.item?.view.lyt.centerY)
        }
        return self.trailing(trailing)
            .centerY(centerY)
    }
    
    /// 【右中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingCenterY(by trailing: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.trailing(by: trailing, offset: offset)
            .centerY(by: trailing)
    }
}

// MARK: 右上 右下(done)

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【右上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ value: CombinedLiteral = .default) -> Self {
        return self.trailing(value)
            .top(value)
    }
    
    @discardableResult
    func trailingTop(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.trailing(by: view, offset: offset)
            .top(by: view, offset: offset)
    }
    
    @discardableResult
    func safeTrailingTop(_ value: CombinedLiteral = .default) -> Self {
        return self.safeTrailing(value)
            .safeTop(value)
    }
    
    @discardableResult
    func safeTrailingTop(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.safeTrailing(by: view, offset: offset)
            .safeTop(by: view, offset: offset)
    }
    
    /// 【右上边距 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ trailing: CombinedLiteral,
                     _ top: CombinedLiteral) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【右上边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ trailing: XaxisOffset,
                     _ top: YaxisOffset) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【右下边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ value: CombinedLiteral = .default) -> Self {
        return self.trailing(value)
            .bottom(value)
    }
    
    @discardableResult
    func trailingBottom(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.trailing(by: view, offset: offset)
            .bottom(by: view, offset: offset)
    }
    
    @discardableResult
    func safeTrailingBottom(_ value: CombinedLiteral = .default) -> Self {
        return self.safeTrailing(value)
            .safeBottom(value)
    }
    
    @discardableResult
    func safeTrailingBottom(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.safeTrailing(by: view, offset: offset)
            .safeBottom(by: view, offset: offset)
    }
    
    /// 【右下边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ trailing: CombinedLiteral,
                        _ bottom: CombinedLiteral) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
    
    /// 【右下边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ trailing: XaxisOffset,
                        _ bottom: YaxisOffset) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
}
