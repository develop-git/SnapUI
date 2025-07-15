//
//  CoreFoundation+CGRect.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension CGRect {
    var maxY: CGFloat {
        return CGRectGetMaxY(self)
    }
    var minY: CGFloat {
        return CGRectGetMinY(self)
    }
    var maxX: CGFloat {
        return CGRectGetMaxX(self)
    }
    var minX: CGFloat {
        return CGRectGetMinX(self)
    }
    var width: CGFloat {
        return self.size.width
    }
    var height: CGFloat {
        return self.size.height
    }
}
