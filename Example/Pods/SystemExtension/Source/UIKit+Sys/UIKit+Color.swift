//
//  UIColor+Exts.swift
//  Foundation+Extra
//
//  Created by jian on 2023/4/21.
//


// MARK: ----- UIColor ------
public extension UIColor {
    /// 使用rgb生成颜色
    /// - Parameters:
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        let divisor = CGFloat(255)
        self.init(red: r / divisor, green: g / divisor, blue: b / divisor, alpha: alpha)
    }
    
    /// 使用rgb生成颜色
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) {
        let divisor = CGFloat(255)
        self.init(red: red / divisor, green: green / divisor, blue: blue / divisor, alpha: alpha)
    }
    
    /// hex颜色，支持：RGB、ARGB、RRGGBB、AARRGGBB
    convenience init(hex: String?) {
        guard let hex = Self.removeHexPrefix(hex), hex.count.in(1...8) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
            return
        }
        let rgba = Self.hexRGBA(with: hex)
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
    
    /// hex颜色，支持：RGB、ARGB、RRGGBB、AARRGGBB
    @discardableResult
    static func hex(with hexString: String?) -> UIColor {
        guard let hex = removeHexPrefix(hexString), hex.count.in(1...8) else {
            return .clear
        }
        let rgba = hexRGBA(with: hex)
        return UIColor(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
    
    /// 使用rgba生成颜色
    @discardableResult
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        UIColor(r: r, g: g, b: b, alpha: alpha)
    }
    
    /// 使用rgba生成颜色
    @discardableResult
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        UIColor(r: red, g: green, b: blue, alpha: alpha)
    }
    
    /// 生成随机颜色
    static var random: UIColor {
       return UIColor(.random(in:0...255), .random(in:0...255), .random(in:0...255))
    }
}

public extension UIColor {
    
    /// 使用图片生成颜色
    /// - Parameter image: 图片源
    static func imageColor(_ image: UIImage?) -> UIColor {
        guard let image = image else {return UIColor(r: 0, g: 0, b: 0)}
        return UIColor(patternImage: image)
    }
    
    /// 添加透明度
    /// - Parameter opacity: 透明度
    @discardableResult
    func opacity(_ opacity: CGFloat) -> UIColor {
        self.withAlphaComponent(opacity)
    }
    
    /// 透明渐变转换
    /// - Parameters:
    ///   - color: 目标颜色
    ///   - opacity: 当前透明度
    @discardableResult
    func change(to color: UIColor, opacity: CGFloat) -> UIColor {
        let opacity =  Swift.min(opacity, 1.0)
        let fromComp = self.compnent()
        let toComp = color.compnent()
        let finalR = fromComp.red + (toComp.red - fromComp.red) * opacity
        let finalG = fromComp.green + (toComp.green - fromComp.green) * opacity
        let finalB = fromComp.blue + (toComp.blue - fromComp.blue) * opacity
        let finalA = fromComp.alpha + (toComp.alpha - fromComp.alpha) * opacity
        return UIColor(r: finalR, g: finalG, b: finalB, alpha: finalA)
    }
}

public extension UIColor {
    static let grapefruit = UIColor.rgb(239, 83, 98)
    static let bittersweet = UIColor.rgb(254, 109, 75)
    static let sunflower = UIColor.rgb(255, 207, 71)
    static let grass = UIColor.rgb(159, 214, 97)
    static let mint = UIColor.rgb(63, 208, 173)
    static let klein = UIColor.rgb(6, 92, 208)
    static let blueJeans = UIColor.rgb(90, 154, 239)
    static let lavender = UIColor.rgb(172, 143, 239)
    static let pinkRose = UIColor.rgb(238, 133, 193)
    static let dark = UIColor.rgb(39, 192, 243)
}

public extension UIColor {
    /// 白色
    /// 珍珠白
    static let white1 = UIColor(242, 242, 246)
    /// 黑色
    static let black1 = UIColor(hex: "010101")
    static let black2 = UIColor(hex: "0E131F")
    static let black3 = UIColor(hex: "15031B")
    static let black4 = UIColor(hex: "201E1F")
    static let black5 = UIColor(hex: "22162B")
    static let black6 = UIColor(18, 19, 18)
    static let black7 = UIColor(28, 28, 30)
    /// 绿色
    static let green1 = UIColor(hex: "008147")
    static let green2 = UIColor(hex: "17C3B2")
    static let green3 = UIColor(hex: "407F3E")
    static let green4 = UIColor(hex: "446B50")
    static let green5 = UIColor(hex: "5D7B6F")
    static let green6 = UIColor(hex: "64A587")
    static let green7 = UIColor(hex: "70B2C4")
    static let green8 = UIColor(hex: "89B449")
    static let green9 = UIColor(hex: "A4C3A2")
    static let green10 = UIColor(hex: "ADC241")
    /// 蓝色
    static let blue1 = UIColor(hex: "05299E")
    static let blue2 = UIColor(hex: "001949")
    static let blue3 = UIColor(hex: "001C44")
    static let blue4 = UIColor(hex: "070544")
    static let blue6 = UIColor(hex: "0B1F3A")
    static let blue7 = UIColor(hex: "12103D")
    static let blue8 = UIColor(hex: "17103A")
    static let blue9 = UIColor(hex: "4361EE")
    static let blue10 = UIColor(hex: "4EB09B")
    static let blue11 = UIColor(hex: "4CC9F0")
    /// 紫色
    static let purple1 = UIColor(hex: "361D9D")
    static let purple2 = UIColor(hex: "451F55")
    static let purple3 = UIColor(hex: "4A26AB")
    static let purple4 = UIColor(hex: "5D3B78")
    static let purple5 = UIColor(hex: "7209B7")
    static let purple6 = UIColor(hex: "9543A7")
    static let purple7 = UIColor(hex: "956AD6")
    static let purple8 = UIColor(hex: "C688EB")
    /// 红色
    static let red1 = UIColor(hex: "FF0035")
    static let red2 = UIColor(hex: "FF4000")
    static let red3 = UIColor(hex: "FFBGAF")
    static let red4 = UIColor(hex: "FFFSEC")
    static let red5 = UIColor(hex: "FB6376")
    static let red6 = UIColor(hex: "F72585")
    static let red7 = UIColor(hex: "F20231")
    static let red8 = UIColor(hex: "A10856")
    static let red9 = UIColor(hex: "851639")
    static let red10 = UIColor(hex: "DE4D86")
    /// 黄色
    static let yellow1 = UIColor(hex: "FFB758")
    static let yellow2 = UIColor(hex: "FFD273")
    static let yellow3 = UIColor(hex: "FEC63C")
    static let yellow4 = UIColor(hex: "FEA837")
    static let yellow5 = UIColor(hex: "F4A82C")
    static let yellow6 = UIColor(hex: "FEF9EF")
    static let yellow7 = UIColor(hex: "EFB53F")
    /// 灰色
    static let gray1 = UIColor.rgb(53, 60, 70)
    static let gray2 = UIColor.rgb(73, 80, 90)
    static let gray3 = UIColor.rgb(93, 100, 110)
    static let gray4 = UIColor.rgb(113, 120, 130)
    static let gray5 = UIColor.rgb(133, 140, 150)
    static let gray6 = UIColor.rgb(153, 160, 170)
    static let gray7 = UIColor.rgb(173, 180, 190)
    static let gray8 = UIColor.rgb(196, 200, 208)
    static let gray9 = UIColor.rgb(216, 220, 228)
    static let gray10 = UIColor.rgb(93, 91, 92)
    /// 深灰
    static let darkGray1 = UIColor.rgb(218, 220, 224)
    static let darkGray2 = UIColor.rgb(198, 200, 204)
    static let darkGray3 = UIColor.rgb(178, 180, 184)
    static let darkGray4 = UIColor.rgb(158, 160, 164)
    static let darkGray5 = UIColor.rgb(138, 140, 144)
    static let darkGray6 = UIColor.rgb(118, 120, 124)
    static let darkGray7 = UIColor.rgb(98, 100, 104)
    static let darkGray8 = UIColor.rgb(78, 80, 84)
    static let darkGray9 = UIColor.rgb(58, 60, 64)
    static let darkGray10 = UIColor.rgb(207, 205, 206)
}

fileprivate extension UIColor {
    /// 颜色组成
    struct ColorCompnent {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha = 1.0
    }
    func compnent() -> ColorCompnent {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return ColorCompnent(red: red * 255, green: green * 255, blue: blue * 255, alpha: alpha)
        }
        return ColorCompnent()
    }
    
    /// hex颜色值转 rgb颜色值
    static func hexColorScanner(hex: String, start: Int, len: Int) -> CGFloat {
        guard let substring = hex.substring(from: start, len: len) else { return 0 }
        let fullHex = len == 2 ? substring : "\(substring)\(substring)"
        var value: UInt64 = 0
        guard Scanner(string: fullHex).scanHexInt64(&value) else {
            return 0
        }
        return CGFloat(value) / 255.0
    }
    
    /// hex颜色移除 0x, #, ##
    static func removeHexPrefix(_ hexStr: String?) -> String? {
        guard let hexStr = hexStr, hexStr.count > 0 else { return nil }
        var hex = hexStr
        if hex.hasPrefix("0x") {
            hex = hex.replacingOccurrences(of: "0x", with: "")
        }
        if hex.hasPrefix("#") {
            hex = hex.replacingOccurrences(of: "#", with: "")
        }
        if hex.hasPrefix("##") {
            hex = hex.replacingOccurrences(of: "##", with: "")
        }
        hex = hex.uppercased().replacingOccurrences(of: " ", with: "")
        return hex.count > 0 ? hex : nil
    }
    
    /// hex颜色转 RGBA值
    static func hexRGBA(with hex: String) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        
        var alpha: CGFloat = 1.0, red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        switch hex.count {
        case 3: // #RGB
            red = hexColorScanner(hex: hex, start: 0, len: 1)
            green = hexColorScanner(hex: hex, start: 1, len: 1)
            blue = hexColorScanner(hex: hex, start: 2, len: 1)
        case 4: // #ARGB
            alpha = hexColorScanner(hex: hex, start: 0, len: 1)
            red = hexColorScanner(hex: hex, start: 1, len: 1)
            green = hexColorScanner(hex: hex, start: 2, len: 1)
            blue = hexColorScanner(hex: hex, start: 3, len: 1)
        case 6: // #RRGGBB
            alpha = 1.0
            red = hexColorScanner(hex: hex, start: 0, len: 2)
            green = hexColorScanner(hex: hex, start: 2, len: 2)
            blue = hexColorScanner(hex: hex, start: 4, len: 2)
        case 8: // #AARRGGBB
            alpha = hexColorScanner(hex: hex, start: 0, len: 2)
            red = hexColorScanner(hex: hex, start: 2, len: 2)
            green = hexColorScanner(hex: hex, start: 4, len: 2)
            blue = hexColorScanner(hex: hex, start: 6, len: 2)
        default:
            break
        }
        return (red, green, blue, alpha)
    }
}
