//
//  ConstraintAnchor.swift
//  SnapUI
//
//  Created by jian on 2023/8/11.
//

#if canImport(SnapKit)
import SnapKit
internal typealias Origin = ConstraintItem
#else
internal typealias Origin = Any
#endif

public class ConstraintAnchor {

    internal var origin: Origin
    internal var view: AppView
    
    internal required init(origin: Origin, view: AppView) {
        self.origin = origin
        self.view = view
    }
}

/// leading、trailing、centerX
public final class ViewXaxisAnchor: ConstraintAnchor {}

/// top、bottom、centerY
public final class ViewYaxisAnchor: ConstraintAnchor {}

/// width、height
public final class ViewSizeAnchor: ConstraintAnchor {}
