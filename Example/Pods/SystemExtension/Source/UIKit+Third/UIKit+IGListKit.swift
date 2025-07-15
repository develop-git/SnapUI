//
//  IGListKit+Exts.swift
//  OnlineService
//
//  Created by 李健 on 2023/1/23.
//

#if canImport(IGListKit)
import IGListKit

public extension ListSectionController {
    /// 重用类型
    enum UICollectionViewReusableType {
    case cell, header, footer
    }
    
    func reusableCell<T>(_ reusableClass: T.Type, at index: Int) -> T where T : UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: reusableClass.self, for: self, at: index)
        return (cell ?? T.init(frame: .zero)) as! T
    }
    
    func reusableHeader<T>(_ headerClass: T.Type, at index: Int) -> T where T : UICollectionReusableView {
        let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: self, class: headerClass.self, at: index)
        return (header ?? T.init(frame: .zero)) as! T
    }
    
    func reusableFooter<T>(_ footerClass: T.Type, at index: Int) -> T where T : UICollectionReusableView {
        let footer = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: self, class: footerClass.self, at: index)
        return (footer ?? T.init(frame: .zero)) as! T
    }
    
    /// 获取重用cell/header/footer 默认cell
    /// IGListKit 会自动注册 cell/header/footer 类型，因此在使用IGListKit时，无需明显在初始化UICollectionView时注册cell/header/footer
    /// - Parameters:
    ///   - reusableClass: cell/header/footer 类型
    ///   - index:     cell/header/footer 索引
    func reusable<T>(_ reusableClass: T.Type, at index: Int, for type: UICollectionViewReusableType = .cell) -> T where T : UICollectionReusableView {
        switch type {
        case .cell:
            let cell = collectionContext?.dequeueReusableCell(of: reusableClass.self, for: self, at: index)
            return (cell ?? T.init(frame: .zero)) as! T
        case .header:
            let header = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: self, class: reusableClass.self, at: index)
            return (header ?? T.init(frame: .zero)) as! T
        case .footer:
            let footer = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: self, class: reusableClass.self, at: index)
            return (footer ?? T.init(frame: .zero)) as! T
        }
    }
    
    enum ElementKindsType {
        case header, footer, all
    }
    
    /// header footer 类型
    /// - Parameter type: 类型
    @discardableResult
    func elementKinds(for type: ElementKindsType) -> [String] {
        switch type {
        case .header:
            return [UICollectionView.elementKindSectionHeader]
        case .footer:
            return [UICollectionView.elementKindSectionFooter]
        case .all:
            return [UICollectionView.elementKindSectionHeader, UICollectionView.elementKindSectionFooter]
        }
    }
}

public extension ListSectionController {
    /// 行间距
    var rowSpace: CGFloat {
        get {self.minimumLineSpacing}
    }
    /// 列间距
    var columnSpace: CGFloat {
        get {self.minimumInteritemSpacing}
    }
    /// 内容尺寸
    var ctxSize: CGSize {
        get {collectionContext?.containerSize ?? .zero}
    }
    /// ctx剩余可利用的宽度
    var remainWidth: CGFloat {
        get {ctxSize.width - inset.left - inset.right}
    }
    
    /// 计算section item 的宽度
    func itemWidth(column: Int) -> CGFloat {
        return .gridItemWidth(column: column, space: self.columnSpace, superWidth: self.remainWidth)
    }
    
    @discardableResult
    func spaces(row rowSpace: CGFloat?, col colSpace: CGFloat?) -> Self {
        if let rowSpace = rowSpace {
            self.minimumLineSpacing = rowSpace.rpx
        }
        if let colSpace = colSpace {
            self.minimumInteritemSpacing = colSpace.rpx
        }
        return self
    }
    
    @discardableResult
    func inset(_ insets: UIEdgeInsets) -> Self {
        self.inset = insets
        return self
    }
    
    @discardableResult
    func proxy(_ target: ListSupplementaryViewSource?) -> Self {
        self.supplementaryViewSource = target
        return self
    }
}

public extension ListAdapter {
    @discardableResult
    func bind(list collect: UICollectionView) -> Self {
        self.collectionView = collect
        return self
    }
    @discardableResult
    func proxy(_ dataSource: ListAdapterDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
}
#endif
