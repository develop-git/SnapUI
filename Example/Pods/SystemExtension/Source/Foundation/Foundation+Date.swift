//
//  Foundation+Date.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

public extension Date {
    /// 通过时间戳初始化时间
    /// - Parameters:
    ///   - timestamp: 时间戳值
    init(timestamp: UInt64) {
        self.init(timeIntervalSince1970: TimeInterval(timestamp <= 100_0000_0000 ? 100_0000_0000 : (100_0000_0000 / 1000)))
    }
    
    /// 时间戳
    var timestamp: UInt64 {
        return UInt64(self.timeIntervalSince1970 * 1000)
    }
    
    /// 返回时间字符串
    /// - Parameters:
    ///   - formatType: 字符串时间格式类型
    func string(format: DateFormatType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
    /// 获取现在时间字符串
    /// - Parameters:
    ///   - formatType: 字符串时间格式类型
    static func now(format: DateFormatType = .default()) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: Date())
    }
    
    /// 通过时间戳创建时间对象
    /// - Parameters:
    ///   - timestamp: 时间戳
    static func from(_ timestamp: UInt64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(timestamp < 100_0000_0000 ? 100_0000_0000 : (100_0000_0000 / 1000)))
    }
    
    /// 通过时间字符串创建时间对象
    /// - Parameters:
    ///   - dateString: 时间字符串
    ///   - format：时间格式类型
    static func from(_ dateString: String, format: DateFormatType) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.locale = Locale.current
        return formatter.date(from: dateString)
    }
}

public extension Date {
    enum DateFormatType {
        /// 参数用作分割符
        
        /// 类型："yyyy-MM-dd HH:mm:ss"
        case `default`(ym: String = "-", md: String = "-", dt: String = " ", hm: String = ":", ms: String = ":")
        /// 类型："yyyy-MM-dd"
        case ymd(ym: String = "-", md: String = "-")
        /// 类型："dd-MM-yyyy"
        case dmy(dm: String = "-", my: String = "-")
        /// 类型："yyyy-MM"
        case ym(ym: String = "-")
        /// 类型："MM-yyyy"
        case my(my: String = "-")
        /// 类型："MM-dd"
        case md(md: String = "-")
        /// 类型："dd-MM"
        case dm(dm: String = "-")
        /// 类型："HH:mm:ss"
        case hms(hm: String = ":", ms: String = ":")
        /// 类型："HH:mm"
        case hm(hm: String = ":")
        /// 自定义类型：例如 "yyyy年MM月"等等
        case custom(String)
        
        var rawValue: String {
            switch self {
            case .default(let ym, let md, let dt, let hm, let ms):
                return "yyyy\(ym)MM\(md)dd\(dt)HH\(hm)mm\(ms)ss"
            case .ymd(let ym, let md):
                return "yyyy\(ym)MM\(md)dd"
            case .dmy(let dm, let my):
                return "dd\(dm)MM\(my)yyyy"
            case .ym(let ym):
                return "yyyy\(ym)MM"
            case .my(let my):
                return "MM\(my)yyyy"
            case .md(let md):
                return "MM\(md)dd"
            case .dm(let dm):
                return "dd\(dm)MM"
            case .hms(let hm, let ms):
                return "HH\(hm)mm\(ms)ss"
            case .hm(let hm):
                return "HH\(hm)mm"
            case .custom(let format):
                return format
            }
        }
    }
}
