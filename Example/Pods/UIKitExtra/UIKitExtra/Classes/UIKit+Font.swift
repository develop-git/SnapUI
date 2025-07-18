//
//  UIFont.swift
//  Foundation+Extra
//
//  Created by jian on 2023/4/21.
//



// MARK: ----- UIFont ------
public extension UIFont {
    
    static func system(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        UIFont.boldSystemFont(ofSize: size)
    }
}

@available(iOS 11.0, *)
public extension UIFont {
    static let designKit = DesignKitTypography()

    struct DesignKitTypography {
        public var display1: UIFont {
            scaled(baseFont: .systemFont(ofSize: 42, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        }

        public var display2: UIFont {
            scaled(baseFont: .systemFont(ofSize: 36, weight: .semibold), forTextStyle: .largeTitle, maximumFactor: 1.5)
        }

        public var title1: UIFont {
            scaled(baseFont: .systemFont(ofSize: 24, weight: .semibold), forTextStyle: .title1)
        }

        public var title2: UIFont {
            scaled(baseFont: .systemFont(ofSize: 20, weight: .semibold), forTextStyle: .title2)
        }

        public var title3: UIFont {
            scaled(baseFont: .systemFont(ofSize: 18, weight: .semibold), forTextStyle: .title3)
        }

        public var title4: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .regular), forTextStyle: .headline)
        }

        public var title5: UIFont {
            scaled(baseFont: .systemFont(ofSize: 12, weight: .regular), forTextStyle: .subheadline)
        }

        public var bodyBold: UIFont {
            scaled(baseFont: .systemFont(ofSize: 16, weight: .semibold), forTextStyle: .body)
        }

        public var body: UIFont {
            scaled(baseFont: .systemFont(ofSize: 16, weight: .light), forTextStyle: .body)
        }

        public var captionBold: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .semibold), forTextStyle: .caption1)
        }

        public var caption: UIFont {
            scaled(baseFont: .systemFont(ofSize: 14, weight: .light), forTextStyle: .caption1)
        }

        public var small: UIFont {
            scaled(baseFont: .systemFont(ofSize: 12, weight: .light), forTextStyle: .footnote)
        }
    }
}

@available(iOS 11.0, *)
private extension UIFont.DesignKitTypography {
    func scaled(baseFont: UIFont, forTextStyle textStyle: UIFont.TextStyle = .body, maximumFactor: CGFloat? = nil) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)

        if let maximumFactor = maximumFactor {
            let maximumPointSize = baseFont.pointSize * maximumFactor
            return fontMetrics.scaledFont(for: baseFont, maximumPointSize: maximumPointSize)
        }
        return fontMetrics.scaledFont(for: baseFont)
    }
}
