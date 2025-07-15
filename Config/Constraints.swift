//
//  Constraints.swift
//  SnapUI
//
//  Created by by jian on 2023/4/28.
//

public enum Constraints {
    case comb(Maker, Relation)
    
    public enum Maker: Int {
        case make
        case update
    }

    public enum Relation: Int {
        case equal
        case min
        case max
    }

    public enum Attribute: Int {
        /// x-axis
        case leading, trailing, centerX
        /// y-axis
        case top, bottom, centerY
        /// baseline
        case firstBaseline, lastBaseline
        /// size
        case width, height
    }
}

internal extension Constraints {
    var raw: (maker: Maker, relation: Relation) {
        switch self {
        case .comb(let maker, let relation):
            return (maker, relation)
        }
    }
    
    func reversalRelation() -> Constraints {
        switch self.raw.relation {
        case .equal:
            return self
        case .min:
            return .comb(self.raw.maker, .max)
        case .max:
            return .comb(self.raw.maker, .min)
        }
    }
}

internal extension Constraints.Relation {
    var constraints: Constraints {
        return .comb(.make, self)
    }
}
