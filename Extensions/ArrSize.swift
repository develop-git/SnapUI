//
//  SnapKit+ArrSize.swift
//  SnapUI
//
//  Created by jian on 2023/8/10.
//

@available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
public extension SnapViewsDSL {

    /// 【 width】
    @discardableResult
    func width(_ width: CombinedLiteral) -> Self {
        array.forEach { $0.lyt.width(width) }
        return self
    }

    /// 【将传入视图的width/height赋值给当前对象的 width】
    @discardableResult
    func width(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one) -> Self {
        array.forEach { $0.lyt.width(by: anchor, mult: mult) }
        return self
    }

    /// 【将传入视图的width/height赋值给当前对象的 width】
    @discardableResult
    func width(by view: AppView, mult: CombinedLiteral = .one) -> Self {
        array.forEach { $0.lyt.width(by: view, mult: mult) }
        return self
    }
}

@available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
public extension SnapViewsDSL {

    /// 【height】
    @discardableResult
    func height(_ height: CombinedLiteral) -> Self {
        array.forEach { $0.lyt.height(height) }
        return self
    }

    /// 【将传入视图的width/height赋值给当前对象的 height】
    @discardableResult
    func height(by anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one) -> Self {
        array.forEach { $0.lyt.height(by: anchor, mult: mult) }
        return self
    }

    /// 【将传入视图的width/height赋值给当前对象的 height】
    @discardableResult
    func height(by view: AppView, mult: CombinedLiteral = .one) -> Self {
        array.forEach { $0.lyt.height(by: view, mult: mult) }
        return self
    }
}

@available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
public extension SnapViewsDSL {
    
    /// 【水平布局】
    /// 同时调用 horizontalLayout 和 verticalLayout 方法会造成约束冲突，此种情形应采用 grid 方法做网格布局
    /// - Parameters:
    ///   - space: 子视图间距
    ///   - flex: 视图是否自动伸缩
    ///   - inset: 整体视图外边距
    @discardableResult
    func horizontalLayout(space: Float,
                    flex: Bool = false,
                    insets: SnapViewDSL.EdgeInsets = .init()) -> Self
    {
        array.enumerated { v, emRef in
            let offset = emRef.isfirst ? insets.left : CombinedLiteral(value: space)
            v.lyt.vertical(insets.top, insets.bottom)
            v.lyt.leading(by: emRef.refer?.lyt.trailing, offset: offset)
            if emRef.islast {
                v.lyt.trailing(.max(insets.right.raw.val))
            }
            if let prev = emRef.refer, !flex {
                v.lyt.width(by: prev.lyt.width)
            }
        }
        return self
    }

    /// 【垂直布局】
    /// 同时调用 horizontalLayout 和 verticalLayout 方法会造成约束冲突，此种情形应采用 grid 方法做网格布局
    /// - Parameters:
    ///   - space: 子视图间距
    ///   - flex: 视图是否自动伸缩
    ///   - inset: 整体视图外边距
    @discardableResult
    func verticalLayout(space: Float,
                    flex: Bool = false,
                    insets: SnapViewDSL.EdgeInsets = .init()) -> Self
    {
        array.enumerated { v, emrt in
            let offset = emrt.isfirst ? insets.top : CombinedLiteral(value: space)
            v.lyt.horizontal(insets.left, insets.right)
            v.lyt.top(by: emrt.refer?.lyt.bottom, offset: offset)
            if emrt.islast {
                v.lyt.bottom(.max(insets.bottom.raw.val))
            }
            if let prev = emrt.refer, !flex {
                v.lyt.height(by: prev.lyt.height)
            }
        }
        return self
    }

    /// 【网格视图】
    /// - Parameters:
    ///   - colums: 布局多少列
    ///   - layout: 布局类型（相等，方形，内容适配）
    ///   - spaces: 布局间距
    ///   - insets: 布局外边距
    @discardableResult
    func gridLayout(colums: Int,
                    layout: GridItemsLayoutType = .equal,
                    spaces: GridItemsSpaces = .one,
                    insets: SnapViewDSL.EdgeInsets = .init()) -> Self
    {
        array.enumeratedGrid(colums: colums) { v, prev, row, col in
            // rows
            let rowOffset = row.isfirst ? insets.top : spaces.raw.row
            v.lyt.top(by: row.refer?.lyt.bottom, offset: rowOffset)
            v.lyt.bottom(.max(insets.bottom.raw.val))
            
            // cols
            let colOffset = col.isfirst ? insets.left : spaces.raw.col
            v.lyt.leading(by: col.refer?.lyt.trailing, offset: colOffset)
            if col.islast {
                v.lyt.trailing(insets.right)
            } else {
                v.lyt.trailing(.max(insets.right.raw.val))
            }

            if let prev = prev {
                switch layout {
                case .equal: v.lyt.size(by: prev)
                case .square: v.lyt.size(by: prev.lyt.width)
                case .flex: v.lyt.width(by: prev.lyt.width)
               }
            }
        }
        // Fix first element size layout for square
        if layout == .square, let first = array.first, let last = array.last {
            first.lyt.size(by: last)
        }
        return self
    }
}


private extension Array {
    struct EnumeratedRefer {
        var isfirst: Bool = true
        var islast: Bool = true
        var refer: Element?
        init(isfirst: Bool, islast: Bool, refer: Element?) {
            self.isfirst = isfirst
            self.islast = islast
            self.refer = refer
        }
    }
    
    /// 数组遍历
    func enumerated(_ enumerate: (_ elmt: Element, _ elmtRef: EnumeratedRefer)->Void) {
        
        guard count > 0 else { return }
        
        var prev: Element?
        
        for (i,e) in self.enumerated() {
            
            let emrt = EnumeratedRefer(isfirst: i == 0, islast: i == count - 1, refer: prev)
            enumerate(e, emrt)
            
            prev = e
        }
    }
    
    /// 九宫格遍历
    func enumeratedGrid(colums: Int, enumerate: (_ elmt: Element, _ prev: Element?, _ rowRef: EnumeratedRefer, _ colRef: EnumeratedRefer)->Void) {
        
        guard count > 0 else { return }
        
        let arr = self
        
        let colums = Swift.min(count, Swift.max(colums, 2))
        let lastCol = colums - 1
        
        let rows = count % colums == 0 ? count / colums : count / colums + 1
        let lastRow = rows - 1
        
        var prev: Element?
        
        for (i,e) in arr.enumerated() {
            
            let curRow = i / colums
            let curCol = i % colums
            let row = EnumeratedRefer(isfirst: curRow == 0, islast: curRow == lastRow, refer: arr.at(i - colums))
            let col = EnumeratedRefer(isfirst: curCol == 0, islast: curCol == lastCol, refer: curCol == 0 ? nil : prev)
            
            enumerate(e, prev, row, col)
            
            prev = e
        }
    }
    
    func isSafe(at index: Int) -> Bool {
        if (startIndex..<endIndex).contains(index) {
            return true
        }
        return false
    }
    
    func at(_ index: Int?) -> Element? {
        guard let index = index else { return nil }
        return isSafe(at: index) ? self[index] : nil
    }
}
