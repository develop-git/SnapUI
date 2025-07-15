//
//  RxSwift+Exts.swift
//  OnlineService
//
//  Created by jian on 2023/6/14.
//

import Foundation
#if canImport(RxSwift)
import RxSwift
import RxCocoa


public protocol OptionalType {
    associatedtype Wrapped

    var value: Wrapped? { get }
}

public extension Observable where Element : OptionalType {
    func filterNil() -> Observable<Element.Wrapped> {
        return flatMap { element -> Observable<Element.Wrapped> in
            guard let val = element.value else { return .empty()}
            return .just(val)
        }
    }
    
    func replaceNil(with value: Element.Wrapped) -> Observable<Element.Wrapped> {
        return flatMap { element -> Observable<Element.Wrapped> in
            guard let val = element.value else { return .just(value)}
            return .just(val)
        }
    }
}

public extension ObservableType where Element == Bool {
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}

public extension Observable where Element: Equatable {
    func ignore(value: Element) -> Observable<Element> {
        return filter { (selfE) -> Bool in
            return value != selfE
        }
    }
}

public extension ObservableType {
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map {_ in}
    }
}



#endif
