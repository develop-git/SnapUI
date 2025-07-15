//
//  MJRefresh+Exts.swift
//  OnlineService
//
//  Created by jian on 2023/7/9.
//

#if canImport(MJRefresh)
import MJRefresh

public extension UIKitSetting where Base : UIScrollView {
    
    func headerRefresh(_ action: @escaping (_ refreshView: UIScrollView?)->Void) -> MJRefreshHeader {
        
        let header = MJRefreshNormalHeader {[weak base] in
            action(base)
        }
        header.lastUpdatedTimeLabel?.isHidden = true
        header
            .autoChangeTransparency(true)
            .link(to: base)
        return header
    }
    
    func footerRefresh(_ action: @escaping (_ refreshView: UIScrollView?)->Void) -> MJRefreshFooter {
        let footer = MJRefreshAutoNormalFooter {[weak base] in
            action(base)
        }
        footer.setTitle("~~我是有底线的~~", for: .noMoreData)
        footer.setTitle("", for: .idle)
        footer
            .autoChangeTransparency(true)
            .link(to: base)
        return footer
    }
}

#if canImport(RxSwift)
import RxCocoa
import RxSwift

public extension Reactive where Base : MJRefreshComponent {
    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { refreshControl, active in
            if !active {
                refreshControl.endRefreshing()
            }
        }
    }
}
#endif
#endif

