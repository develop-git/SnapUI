//
//  Foundation+Crypto.swift
//  Foundation-Extra
//
//  Created by jian on 2023/9/20.
//

import Foundation

#if canImport(CommonCrypto)
import CommonCrypto

public extension StringProtocol {
    @available(iOS, deprecated: 13.0)
    func md5Str(ecording: String.Encoding = .utf8) -> String? {
        return data(using: ecording)?.md5.hexadecimal
    }
    
    @available(iOS, deprecated: 13.0)
    func md5(ecording: String.Encoding = .utf8) -> Data? {
        return data(using: ecording)?.md5
    }
    
    func sha256Str(ecording: String.Encoding = .utf8) -> String? {
        return data(using: ecording)?.sha256.hexadecimal
    }
    
    func sha256(ecording: String.Encoding = .utf8) -> Data? {
        return data(using: ecording)?.sha256
    }
}

public extension Data {
    var hexadecimal: String {
        map { String(format: "%02x", $0)}.joined()
    }
    
    @available(iOS, deprecated: 13.0)
    var md5: Data {
        withUnsafeBytes { buffer in
            var digest = Data(count: Int(CC_MD5_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes { disBuffer in
                _ = CC_MD5(buffer.baseAddress, CC_LONG(disBuffer.count), disBuffer.baseAddress)
            }
            return digest
        }
    }
    
    var sha256: Data {
        withUnsafeBytes { buffer in
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes { disBuffer in
                _ = CC_SHA256(buffer.baseAddress, CC_LONG(buffer.count), disBuffer.baseAddress)
            }
            return digest
        }
    }
}
#endif
