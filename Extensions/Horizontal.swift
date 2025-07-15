//
//  SnapKit+horizontal.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//

// MARK: 水平

@available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
public extension SnapViewDSL {
    /// 【左右边距，默认 10 】
    @discardableResult
    func horizontal(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        return self.leading(offset)
            .trailing(offset)
    }
    
    /// 【左右安全边距，默认 10 】
    @discardableResult
    func safehorizontal(_ offset: CombinedLiteral = .equal(.defaultOffset)) -> Self {
        return self.safeLeading(offset)
            .safeTrailing(offset)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horizontal(_ leading: CombinedLiteral,
              _ trailing: CombinedLiteral) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    /// 【左右安全边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func safehorizontal(_ leading: CombinedLiteral,
                  _ trailing: CombinedLiteral) -> Self
    {
        return self.safeLeading(leading)
            .safeTrailing(trailing)
    }
    
    /// 【左右边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horizontal(_ leading: XaxisOffset,
              _ trailing: XaxisOffset) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    @discardableResult
    func horizontal(by view: AppView,
              leading: CombinedLiteral = nil,
              trailing: CombinedLiteral = nil) -> Self
    {
        return self.leading(by: view.lyt.leading, offset: leading)
            .trailing(by: view.lyt.trailing, offset: trailing)
    }
}
