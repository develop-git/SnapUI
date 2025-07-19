//
//  SnapKit+margins.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//

// MARK: - ------ margins ------
@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 【充满父视图】
    @discardableResult
    func fill() -> Self {
        return self.top(0).bottom(0).leading(0).trailing(0)
    }
    
    /// 【充满父视图】
    @discardableResult
    func safeFill() -> Self {
        return self.safeTop(0).safeBottom(0).safeLeading(0).safeTrailing(0)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 边距，默认 10 】
    @discardableResult
    func margin(_ len: CombinedLiteral = .default) -> Self {
        return self.top(len).bottom(len).leading(len).trailing(len)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右安全边距，默认 10 】
    @discardableResult
    func safeMargin(_ len: CombinedLiteral = .default) -> Self {
        return self.safeTop(len).safeBottom(len).safeLeading(len).safeTrailing(len)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同边距 】
    @discardableResult
    func margin(_ inset: EdgeInsets) -> Self {
        return self.top(inset.top).bottom(inset.bottom).leading(inset.left).trailing(inset.right)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同安全边距 】
    @discardableResult
    func safeMargin(_ inset: EdgeInsets) -> Self {
        return self.safeTop(inset.top).safeBottom(inset.bottom).safeLeading(inset.left).safeTrailing(inset.right)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 安全边距，默认 10 】
    @discardableResult
    func safeMargin(_ edges: RectEdge, _ len: Float) -> Self {
        let lv = CombinedLiteral(value: len)
        if edges.contains(.all) {
            return self.safeTop(lv).safeBottom(lv)
                .safeLeading(lv).safeTrailing(lv)
        }
        /// top
        if edges.contains(.top) {
            self.safeTop(lv)
        }
        /// left
        if edges.contains(.left) {
            self.safeLeading(lv)
        }
        /// right
        if edges.contains(.right) {
            self.safeTrailing(lv)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.safeBottom(lv)
        }
        return self
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 边距，默认 10 】
    @discardableResult
    func margin(_ edges: RectEdge, _ len: Float) -> Self {
        let lv = CombinedLiteral(value: len)
        if edges.contains(.all) {
            return self.top(lv).bottom(lv)
                .leading(lv).trailing(lv)
        }
        /// top
        if edges.contains(.top) {
            self.top(lv)
        }
        /// left
        if edges.contains(.left) {
            self.leading(lv)
        }
        /// right
        if edges.contains(.right) {
            self.trailing(lv)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottom(lv)
        }
        return self
    }
}
