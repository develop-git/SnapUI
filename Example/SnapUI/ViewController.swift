//
//  ViewController.swift
//  SnapUI
//
//  Created by FullStack-Jian on 02/10/2024.
//  Copyright (c) 2024 FullStack-Jian. All rights reserved.
//
//import SwiftUI
//
//@available(iOS 15.0, *)
//struct v: View {
//    var body: some View {
//        Text("sl").overlay {
//            Text("sfls")
//                .padding()
//        }
//        .padding(.all, 10)
//    }
//    
//}

import UIKit
import SnapUI
import UIKitExtra

func initUI<T: UIResponder>(_ object: T = .init(), config: (T) -> Void) -> T {
    config(object)
    return object
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // eg: 1
       
        let temp: UIView = initUI(.init()) { view in
            view.set.background(.yellow)
        }
        temp.add(to: view)
            .margin(.unbottom, 10)
            .height(120)
        
        let lab: UILabel = initUI(.init(text: "Hellow init")) {
            $0.set
                .background(.blue, radius: 30, for: .diagonal)
                .text(<#T##text: String?##String?#>)
        }
//        temp.addSubview(lab)
        lab.add(to: temp)
            .bottom()
            .width(200)
//            .height(60)
            .margin(.unright, 30)
        
        // eg: 2
        let temp2 = UIView()
        temp2.backgroundColor = .red
        view.addSubview(temp2)
        temp2.lyt.size(100)
            .top(by: temp.lyt.bottom)
        
        let tv: TempView = initUI { tv in
            tv.set.background(.green)
        }
        tv.add(to: view)
            .size(300)
            .top(by: temp2.lyt.bottom)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

