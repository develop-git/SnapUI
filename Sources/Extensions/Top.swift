//
//  SnapKit+Top.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//


// MARK: top

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 【上边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        guard let ret = verify(at: .top, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(_ offset: YaxisOffset) -> Self {
        guard let ret = verify(at: .top, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeTop(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        guard let ret = verify(at: .top, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【以传入视图的视图顶部为起始点设置当前对象的边距值 上边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.top, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeTop(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func safeTop(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.safeTop, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .top, extra: ret.extra)
    }
    
    /// 【上中边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func topCenterX(_ top: YaxisOffset,
                    _ centerX: XaxisOffset? = nil) -> Self
    {
        guard let centerX = centerX else {
            return self.top(top)
                .centerX(by: top.raw.item?.view.lyt.centerX)
        }
        return self.top(top)
            .centerX(centerX)
    }
    
    /// 【上中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func topCenterX(by top: AppView, offset: CombinedLiteral = nil) -> Self {
        return self.top(by: top, offset: offset)
            .centerX(by: top)
    }
}
