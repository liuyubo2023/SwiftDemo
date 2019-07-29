//
//  RxSwiftViewController.swift
//  SwiftDemo
//
//  Created by Liuyubo on 2019/7/29.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController : UIViewController {
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        button.setTitle("click", for: UIControl.State.normal)
        button.backgroundColor = UIColor.blue
        
        view.addSubview(button)
        button.rx.tap.subscribe(onNext: {
            print("button Tapped")
        }).disposed(by: bag)
        
        
    }
}
