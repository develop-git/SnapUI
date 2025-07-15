//
//  SnapUI+BaseLine.swift
//  SnapUI
//
//  Created by jian on 2023/10/19.
//

@available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
public extension SnapViewDSL {
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(_ offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .firstBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(_ offset: YaxisOffset) -> Self {
        guard let ret = verify(at: .firstBaseline, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(by anchor: ViewYaxisAnchor?, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .firstBaseline, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(by view: AppView, offset: CombinedLiteral = nil) -> Self {
        guard let ret = verify(at: .firstBaseline, from: view.lyt.firstBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
}
