//
//  FourthViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/16.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import UIKit

class FourthViewController :  UIViewController{
    var closer : ((_ name: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let timer = Timer(timeInterval: 1, target: self, selector: #selector(normalBlock), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .default)
        timer.invalidate()
        
        
        if closer != nil {
            closer!("fourth")   
        }
        normalBlock()
//        let Optional<Int>.some(5)
        let printBlcok = { (str : String) -> Void in
            print(str)
        }
        
//        let printBlcok = {
//            print("Swift")
//        }
        printBlcok("name")
        
        let divide = {(val1: Int, val2: Int) -> Int in
             val1 / val2
        }
        let result = divide(200, 20)
        print (result)
        
//        int(^MyBlockThree)(int,int) = ^(int a,int b) {
//            return a / b;
//        };
//        MyBlockThree(12,56);
        
        
        func combine1(num:Int, handle:(String, String)->(Void)) {
            handle("hello", "world \(num)")
        }
        combine1(num: 2016) { (text, text1) -> (Void) in
            print("\(text) \(text1)")
        }
        
        common { (name) in
            print(name);
        }
    }
    
    @objc func normalBlock() {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
//        let reversedNames = names.sorted()
//        let reversedNames = names.sorted(by: {s1, s2 in s1 > s2} )
//        let reversedNames = names.sorted(by: {$0 > $1})
        let reversedNames = names.sorted(by: >)
        
        for item in reversedNames {
            print(item)
        }
    }
    
    func common(mo name : (String) -> Void) {
        name("common");
    }
    
//    func printBlock() {
//        <#function body#>
//    }
}
