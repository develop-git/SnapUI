//
//  SnapKit+Center.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//

// MARK: - ------ Center  -------

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【以传入视图的中心点设置当前对象的中心点偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func center(offsetX: CombinedLiteral = nil,
                offsetY: CombinedLiteral = nil) -> Self
    {
        return self.centerX(offset: offsetX)
            .centerY(offset: offsetY)
    }
    
    /// 【以传入的数值设置当前对象的中心点x偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerX, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    @discardableResult
    func centerX(_ offset: XaxisOffset) -> Self {
        guard let ret = verify(at: .centerX, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入的数值设置当前对象的中心点y偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerY, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    @discardableResult
    func centerY(_ offset: YaxisOffset) -> Self {
        guard let ret = verify(at: .centerY, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    /// 【以传入视图的中心点设置当前对象的中心点】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func center(by view: AppView,
                offsetX: CombinedLiteral = nil,
                offsetY: CombinedLiteral = nil) -> Self
    {
        return self.centerX(by: view.lyt.centerX, offset: offsetX)
            .centerY(by: view.lyt.centerY, offset: offsetY)
    }
    
    /// 【以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(by anchor: ViewXaxisAnchor?, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerX, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerX, from: view.lyt.centerX, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerY, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    /// 【以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .centerY, from: view.lyt.centerY, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
}
