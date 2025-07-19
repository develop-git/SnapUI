//
//  TestSnap.swift
//  SnapUI_Example
//
//  Created by jian on 2025/7/18.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit

class TempView : UIView {
    init() {
        super.init(frame: .zero)
        self.set.background(.yellow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
