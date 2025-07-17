//
//  SnapUIExtraEnums.swift
//  SnapUI
//
//  Created by jian on 2023/8/9.
//

public extension Float {
    static var defaultOffset: Float { 10 }
}

public extension Int {
    static var defaultOffset: Int { 10 }
}

// MARK: 网格布局类型
public enum GridItemsLayoutType : Int {
    case equal, square, flex
}

// MARK: 网格布局间距
public enum GridItemsSpaces {
    
    case one    // spaces = 1.0
    case equal(_ value: CombinedLiteral) // spaces = value
    case row(_ value: CombinedLiteral)  // rowSpace = value, colSpace = 0.0
    case col(_ value: CombinedLiteral)  // rowSpace = 0.0, colSpace = value
    case diff(_ row: CombinedLiteral, _ col: CombinedLiteral) // rowSpace = row, colSpace = col
}

// MARK: offset\mult\width\height 扩展值
// 数值设置：eg: 1, 1.0, .one, .equal(1.0), .min(1.0), .max(1.0).....
public enum CombinedLiteral : ExpressibleByNilLiteral, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public init(floatLiteral value: Float) {
        self = CombinedLiteral.equal(value)
    }
   
    public init(integerLiteral value: Int) {
        self = CombinedLiteral.equal(Float(value))
    }
    
    public init(nilLiteral: ()) {
        self = CombinedLiteral.equal(Float(0))
    }
    
    public init(value: Float) {
        self = CombinedLiteral.equal(value)
    }
    
    /// Equal
    case `default` // = 10
    case halfone   // = 0.5
    case one    // = 1.0
    case equal(_ value: Float) // = value
    
    case minzero    // >= 0.0
    case min(_ value: Float) // >= value
    
    case maxzero    // <= 0.0
    case max(_ value: Float) // <= value
    
    case comb(Constraints, Float)
}
    
// MARK: 布局偏移扩展值
public enum CombinedOffset<T: ConstraintAnchor> {
    
    case bySuper        // offset = 0.0
    case offset(_ offset: CombinedLiteral)
    case by(_ anchor: T?, offset: CombinedLiteral = .default)
}

public typealias XaxisOffset = CombinedOffset<ViewXaxisAnchor>
public typealias YaxisOffset = CombinedOffset<ViewYaxisAnchor>

// MARK: 布局尺寸扩展值
public enum CombinedSize {
    
    case fill        // multiplier = 1.0
    case wrap        // >= 0.0
    case byMult(_ mult: CombinedLiteral)
    case by(_ anchor: ViewSizeAnchor?, mult: CombinedLiteral = .one)
}

/// 压缩策略
public enum ViewCompressPriority {

    /// 压缩方向
    public enum CompressAxis : Int {
        case horizontal = 0, vertical = 1
    }
    public enum Priority {
        case required, high, medium, low
    }
    /// 是否在水平/垂直方向上进行压缩
    case compress(_ compress: Bool, for: CompressAxis = .horizontal)
    
    /// 水平方向 显示策略（压缩/正常。。。）
    case horizontal(_ priority: Priority)
    
    /// 垂直方向 显示策略（压缩/正常。。。）
    case vertical(_ priority: Priority)
}

// MARK: Internal extensions
internal extension GridItemsSpaces {
    
    var raw: (row: CombinedLiteral, col: CombinedLiteral) {
        switch self {
        case .diff(let row, let col):
            return (row, col)
        case .one:
            return (1, 1)
        case .equal(let val):
            return (val, val)
        case .row(let row):
            return (row, 0)
        case .col(let col):
            return (0, col)
        }
    }
}

internal extension CombinedLiteral {
    
    typealias Relation = Constraints.Relation
    
    var raw: (val: Float, restrict: Constraints) {
        switch self {
        case .default:
            return (10, Relation.equal.constraints)
        case .halfone:
            return (0.5, Relation.equal.constraints)
        case .one:
            return (1, Relation.equal.constraints)
        case .equal(let val):
            return (val, Relation.equal.constraints)
            
        /// Min
        case .minzero:
            return (0, Relation.min.constraints)
        case .min(let val):
            return (val, Relation.min.constraints)
            
        /// Max
        case .maxzero:
            return (0, Relation.max.constraints)
        case .max(let val):
            return (val, Relation.max.constraints)
            
        case .comb(let restrict, let val):
            return (val, restrict)
        }
    }
    
    private var relation: Relation {
        return self.raw.restrict.raw.relation
    }
    
    var invertVal: CombinedLiteral {
        return .comb(self.raw.restrict.reversalRelation(), -self.raw.val)
    }
}

internal extension CombinedOffset {
    var raw: (item: T?, offset: CombinedLiteral) {
        switch self {
        case .by(let item, let offset):
            return (item, offset)
        case .offset(let offset):
            return (nil, offset)
        default:
            return (nil, nil)
        }
    }
}

internal extension CombinedSize {
    
    var raw: (item: ViewSizeAnchor?, mult: CombinedLiteral) {
        switch self {
        case .by(let item, let mult):
            return (item, mult)
        case .byMult(let mult):
            return (nil, mult)
        case .wrap:
            return (nil, .minzero)
        default:
            return (nil, .one)
        }
    }
}

internal extension ViewCompressPriority {
#if os(iOS)
    typealias Axis = NSLayoutConstraint.Axis
    typealias PriorityType = UILayoutPriority
#else
    typealias Axis = NSLayoutConstraint.Orientation
    typealias PriorityType = NSLayoutConstraint.Priority
#endif
    
    var raw: (axis: Axis, priority: PriorityType) {
        switch self {
        case .horizontal(let pr):
            return (Axis(rawValue: 0)!, pr.raw)
        case .vertical(let pr):
            return (Axis(rawValue: 1)!, pr.raw)
        case .compress(let res, let ori):
            return (ori.raw, res ? .defaultLow : .defaultHigh)
        }
    }
}

internal extension ViewCompressPriority.CompressAxis {
    var raw: ViewCompressPriority.Axis {
        return ViewCompressPriority.Axis(rawValue: self.rawValue)!
    }
}

internal extension ViewCompressPriority.Priority {
    typealias PriorityType = ViewCompressPriority.PriorityType
    var raw: PriorityType {
        switch self {
        case .required:
            return PriorityType(rawValue: 1000.0)
        case .high:
            return PriorityType(rawValue: 750.0)
        case .medium:
        #if os(iOS)
            return PriorityType(rawValue: 500.0)
        #else // macOS
            return PriorityType(rawValue: 501.0)
        #endif
        case .low:
            return PriorityType(rawValue: 250.0)
        }
    }
}
