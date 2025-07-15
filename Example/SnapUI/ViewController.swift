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
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.add(to: view)
            .margins()
    }
    
    func textlab(_ text: String) -> UILabel {
        let lab = UILabel()
        lab.text = text
        lab.backgroundColor = .orange
        return lab
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

