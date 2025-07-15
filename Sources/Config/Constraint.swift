//
//  SnapConstraint.swift
//  SnapUI
//
//  Created by jian on 2023/8/9.
//

internal final class SnapConstraint {
    typealias Attribute = Constraints.Attribute
    typealias Relation = Constraints.Relation
    
    private var constraints: [Attribute: LayoutItem] = [:]
    
    /// 更新本地存储约束信息
    /// - Parameters:
    ///   - index: 布局方向
    ///   - anchor: 布局目标
    ///   - extra: 额外布局参数
    ///   - isSuper: 是否相对视图父视进行布局
    /// - Returns: 更新布局信息
    func update(at attr: Attribute, anchor: ConstraintAnchor, extra: CombinedLiteral, isSuper: Bool) -> (restrict: Constraints, anchor: ConstraintAnchor)? {
        
        // 未通过检测，约束冲突
        if !verify(at: attr, isSuper: isSuper) {
            return nil
        }
        
        var relation = extra.raw.restrict.raw.relation
        let value = extra.raw.val
        
        // 约束信息不存在
        guard let snp = constraints[attr] else {
            // 存储约束信息
            constraints[attr] = LayoutItem(anchor: anchor, relation: relation, value: value)
            return (.comb(.make, relation), anchor)
        }
        
        // 约束值未改变
        if snp.value == value {
            return nil
        }
        
        // 更新约束信息
        snp.value = value
        constraints[attr] = snp
        
        // 当约束关系改变时，需要沿用旧的约束关系
        if snp.relation != relation {
            relation = snp.relation
        }
        // 返回布局配置
        return (.comb(.update, relation), snp.anchor)
    }
    
    func removeAll() {
        constraints.removeAll()
    }
}

private extension SnapConstraint {
    
    /// 验证是否有约束冲突
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func verify(at index: Constraints.Attribute, isSuper: Bool) -> Bool {
        // 宽度冲突
        if !horizontalVerify(at: index, isSuper: isSuper) {
            return false
        }
        // 高度冲突
        if !verticalVerify(at: index, isSuper: isSuper) {
            return false
        }
        // 通过验证
        return true
    }
    
    /// 水平方向约束检验
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func horizontalVerify(at index: Constraints.Attribute, isSuper: Bool) -> Bool {
        guard let width = constraints[.width] else {
            return true
        }
        let hasLeading = constraints.has(key: .leading)
        let hasTrailing = constraints.has(key: .trailing)
        let hasCenterX = constraints.has(key: .centerX)
        let isEqual = width.relation == .equal
        
        let horizontalWidth = isEqual && (hasLeading && index == .trailing || hasTrailing && index == .leading) && isSuper
        if horizontalWidth {
            #if DEBUG
            debugPrint("""
                 约束冲突：视图已经设置width，不能再同时设置leading和trailing。
                 解决方法1: 使用.min()/.max()设置动态宽度;
                 解决方法2: 移除.leading/.trailing其中之一。
                 """)
            #endif
            return false
        }
        
        let horizontalCenter1 = hasCenterX && (index == .leading || index == .trailing)
        let horizontalCenter2 = (hasLeading || hasTrailing) && (index == .centerX)

        if isEqual && (horizontalCenter1 || horizontalCenter2) {
            #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置width与centerX, 不能再设置leading或trailing。
                解决方法1: 使用.min()/.max()设置动态宽度;
                解决方法2: 移除.centerX或.leading/.trailing。
                """)
            #endif
            return false
        }
        return true
    }
    
    /// 垂直方向约束检验
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func verticalVerify(at index: Constraints.Attribute, isSuper: Bool) -> Bool {
        guard let height = constraints[.height] else {
            return true
        }
        let hasTop = constraints.has(key: .top)
        let hasBottom = constraints.has(key: .bottom)
        let hasCenterY = constraints.has(key: .centerY)
        let isEqual = height.relation == .equal
        
        let verticalHeight = isEqual && (hasTop && index == .bottom || hasBottom && index == .top) && isSuper
        if verticalHeight {
        #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置height, 不能再同时设置top和bottom。
                解决方法1: 使用.min()/.max()设置动态高度;
                解决方法2: 移除.top/.bottom其中之一。
                """)
            #endif
            return false
        }
        let verticalCenter1 = hasCenterY && (index == .top || index == .bottom)
        let verticalCenter2 = (hasTop || hasBottom) && (index == .centerY)

        if isEqual && (verticalCenter1 || verticalCenter2) {
            #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置height与centerY, 不能再设置top或bottom。
                解决方法1: 使用.min()/.max()设置动态高度;
                解决方法2: 移除.centerY或.top/.bottom。
                """)
            #endif
            return false
        }
        return true
    }
}

private final class LayoutItem {
    typealias Relation = Constraints.Relation
    var relation: Relation
    var value: Float
    var anchor: ConstraintAnchor
    
    init(anchor: ConstraintAnchor, relation: Relation, value: Float) {
        self.relation = relation
        self.value = value
        self.anchor = anchor
    }
}

private extension Dictionary {
    
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
}
