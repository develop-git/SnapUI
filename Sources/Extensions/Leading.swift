//
//  SnapKit+Leading.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//

// MARK: leading
@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【左边距，默认 10 】
    @discardableResult
    func leading(_ offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    @discardableResult
    func leading(_ offset: XaxisOffset) -> Self {
        guard let ret = verify(at: .leading, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeLeading(_ offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .leading, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeLeading(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = .default) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeLeading(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.safeLeading, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左中边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingCenterY(_ leading: XaxisOffset,
                        _ centerY: YaxisOffset? = nil) -> Self
    {
        guard let centerY = centerY else {
            return self.leading(leading)
                .centerY(by: leading.raw.item?.view.lyt.centerY)
        }
        return self.leading(leading)
            .centerY(centerY)
    }
    
    /// 【左中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingCenterY(by leading: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.leading(by: leading, offset: offset)
            .centerY(by: leading)
    }
}

// MARK: 左上 左下(done)
@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【左上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ value: CombinedLiteral = .default) -> Self {
        return self.leading(value)
            .top(value)
    }
    
    @discardableResult
    func leadingTop(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.leading(by: view, offset: offset)
            .top(by: view, offset: offset)
    }
    
    @discardableResult
    func safeLeadingTop(_ value: CombinedLiteral = .default) -> Self {
        return self.safeLeading(value)
            .safeTop(value)
    }
    
    @discardableResult
    func safeLeadingTop(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.safeLeading(by: view, offset: offset)
            .safeTop(by: view, offset: offset)
    }
    
    /// 【左上边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: XaxisOffset,
                    _ top: YaxisOffset) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左上边距】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: CombinedLiteral,
                    _ top: CombinedLiteral) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ value: CombinedLiteral = .default) -> Self {
        return self.leading(value)
            .bottom(value)
    }
    
    @discardableResult
    func leadingBottom(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.leading(by: view, offset: offset)
            .bottom(by: view, offset: offset)
    }
    
    @discardableResult
    func safeLeadingBottom(_ value: CombinedLiteral = .default) -> Self {
        return self.safeLeading(value)
            .safeBottom(value)
    }
    
    @discardableResult
    func safeLeadingBottom(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.safeLeading(by: view, offset: offset)
            .safeBottom(by: view, offset: offset)
    }
    
    /// 【左下边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: XaxisOffset,
                       _ bottom: YaxisOffset) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
    
    /// 【左下边距 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: CombinedLiteral,
                       _ bottom: CombinedLiteral) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
}
