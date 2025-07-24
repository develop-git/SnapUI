//
//  SnapKit+Size.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//


// MARK: - ------ size -------

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    /// 【SnapKit：将传入的数值赋值给当前对象的 width & height】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(_ value: CombinedLiteral) -> Self {
        return self.width(value).height(value)
    }
    
    @discardableResult
    func size(by anchor: ViewSizeAnchor) -> Self {
        return self.width(by: anchor).height(by: anchor)
    }
    
    /// 【将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(width: CombinedLiteral, height: CombinedLiteral) -> Self
    {
        return self.width(width).height(height)
    }
    
    /// 【将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(width: CombinedSize, height: CombinedSize) -> Self
    {
        return self.width(width).height(height)
    }
    
    @discardableResult
    func size(_ size: CombinedSize = .fill) -> Self
    {
        return self.width(size).height(size)
    }
    
    /// 【将传入视图的size赋值给当前对象的size】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(by view: AppView,
              width widthMult: CombinedLiteral = .one,
              height heightMult: CombinedLiteral = .one) -> Self
    {
        return self.width(by: view, mult: widthMult).height(by: view, mult: heightMult)
    }
}

// MARK: - ------ width,height -------

// MARK: width

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 【 width】
    /// 若需要 width 动态变化，可设置为 .max\.min
    @discardableResult
    func width(_ width: CombinedLiteral) -> Self {
        guard let ret = verify(at: .width, extra: .comb(width.raw.restrict, 1.0)) else { return self }
        return multipliedBy(width.raw.val, for: .width, extra: ret.extra)
    }
    
    /// 【 width】
    /// 若需要 width 动态变化，可设置为 .max\.min
    @discardableResult
    func width(_ width: CombinedSize = .fill) -> Self {
        guard let ret = verify(at: .width, from: width.raw.item, extra: width.raw.mult, inSafe: false) else { return self }
        return multipliedBy(ret.anchor, for: .width, extra: ret.extra)
    }
    
    /// 【将传入视图的width/height赋值给当前对象的 width】
    /// 若需要 width动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func width(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one) -> Self {
        guard let ret = verify(at: .width, from: anchor, extra: mult) else { return self }
        return multipliedBy(ret.anchor, for: .width, extra: ret.extra)
    }
    
    /// 【将传入视图的width赋值给当前对象的 width】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func width(by view: AppView, mult: CombinedLiteral = .one) -> Self {
        guard let ret = verify(at: .width, from: view.lyt.width, extra: mult) else { return self }
        return multipliedBy(ret.anchor, for: .width, extra: ret.extra)
    }
}

// MARK: height

@available(iOS 11.0, macOS 11.0, *)
public extension SnapViewDSL {
    
    /// 【height】
    /// 若需要 height 动态变化，可设置为 .max\.min
    @discardableResult
    func height(_ height: CombinedLiteral) -> Self {
        guard let ret = verify(at: .height, extra: .comb(height.raw.restrict, 1.0)) else { return self }
        return multipliedBy(height.raw.val, for: .height, extra: ret.extra)
    }
    
    /// 【height】
    /// 若需要 height 动态变化，可设置为 .max\.min
    @discardableResult
    func height(_ height: CombinedSize = .fill) -> Self {
        guard let ret = verify(at: .height, from: height.raw.item, extra: height.raw.mult, inSafe: false) else { return self }
        return multipliedBy(ret.anchor, for: .height, extra: ret.extra)
    }
    
    /// 【将传入视图的width/height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func height(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one) -> Self {
        guard let ret = verify(at: .height, from: anchor, extra: mult) else { return self }
        return multipliedBy(ret.anchor, for: .height, extra: ret.extra)
    }
    
    /// 【将传入视图的height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func height(by view: AppView, mult: CombinedLiteral = .one) -> Self {
        guard let ret = verify(at: .height, from: view.lyt.height, extra: mult) else { return self }
        return multipliedBy(ret.anchor, for: .height, extra: ret.extra)
    }
}
