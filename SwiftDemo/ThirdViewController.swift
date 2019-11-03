//
//  ThirdViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/13.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

//扩展
class ThirdViewController: UIViewController {
    var delegate : ThirdViewDelegate?
    let num : Int? = 404
    
    private let testView = UIView()
    private var testViewHeight = 100
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(testView)
        testView.backgroundColor = .red
        testView.snp_makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
            make.height.equalTo(testViewHeight)
        }
        
        
        let button = UIButton()
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(0)
            make.height.width.equalTo(100)
        }
        let _ = button.rx.tap.subscribe { [unowned self] (_) in
            self.testViewHeight = self.testViewHeight + 20
            self.testView.snp_updateConstraints { (make) in
                make.height.equalTo(self.testViewHeight)
            }
        }
        
        
        
        if var cont = num {
            cont = 5;
            print(cont)
        }
        
        
        print(num!) // let 404 var 5
        
        
        let kilo = 3.km
        print(kilo)
        
        3.repetions {
            print("repeat")
        }
        
        let john = Person(fullName: "Apple")
        print(john.fullName)
        
        var someInt = 10
        
        changeX(x: &someInt)
        print(someInt)
        
        let stringIndex = findIndex(of: "area", in: ["mike","kobe","area"])
        print(stringIndex!)
        
        self.delegate?.printName(name: "yuboLiu")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // 可变函数，修改值类型
    func changeX(x : inout Int) {
        x += 10
        
        
    }
    
//    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
    
    func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
}

protocol ThirdViewDelegate {
    func printName(name : String)
}

// 泛型实践
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
}

struct Person : FullName {
    var fullName: String
    
}

protocol FullName {
    var fullName : String{get}
    
}

extension Double {
    var km: Double {return self * 1000}
    
}

extension Dictionary {
    func valuesForKeys(keys:[Key]) -> [Value?] {
        return keys.map {self[$0]}
    }
}

extension Int {
    func repetions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
