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
    var subscription:Disposable?
    
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
        
        let taps: Observable<Void> = button.rx.tap.asObservable()
        
        let textfield = UITextField(frame: CGRect(x: 100, y: 250, width: 50, height: 200))
        view.addSubview(textfield)
        subscription = textfield.rx.text.subscribe { (text) in
            print(text)
        }
        
    
//        textfield.rx.text.orEmpty.bind(to: button.rx.isHidden)
        
        behaviorDemo()
        toOber()
        mapDemo()
        emptyDemo()
    }
    
    func behaviorDemo() {
        let subject = BehaviorRelay(value: ["1"])
        
        subject.accept(subject.value + ["2"])
        subject.asObservable().subscribe {
            print("第一次订阅",$0)
        }.disposed(by: bag)
        
        
    }
    
    func toOber() {
        let singleElementSequence = Observable.just(32)

        _ = singleElementSequence
            .subscribe { event in
                print(event)
        }
    }
    
    func mapDemo() {
        let originalSequence = Observable.of(1, 2, 3)
            
        originalSequence
            .map { number in
                number * 2
            }
            .subscribe { print($0) }
            .disposed(by: bag)
    }
    
    func emptyDemo() {
        let disposeBag = DisposeBag()
        Observable<Int>.empty()
            .subscribe { event in
                print(event)
            }
            .disposed(by: disposeBag)
    }
}
