//
//  FirstViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/9/23.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var message: String = ""
    
    
    override func viewDidLoad() {
        self.title = "第一个类"
        self.view.backgroundColor = UIColor.white
        
        let kName = "this is let name"
        message = "message"
        message = kName
        // 元祖
//        let http404 = (404, "not found")
//        print(http404.0)
//        print(http404.1)
        let http404 = (statusCode:404,dec: "not found")
        print(http404.statusCode)
        print(http404.dec)
        
//        var results = [1,3,5,7]
//        let results = values.map ({ (element) -> Int in
//            return element * 2
//        })
        
        var str1:String? = "kl"  // str1值可能是传过来的值或者从服务器获取的值
        let hasValue = str1?.hashValue;
        print(isObjEqual(x: kName, y: str1));
//        let msg = "Hi"
//        let txt = msg + str1!  // runtime error
        
        stringIndex()
    }
    
    func isObjEqual<T:Equatable>(x: T,y: T) -> Bool {
        return x == y;
    }
    
    func stringIndex() {
        let name = "userDefault"
        
        print(name[name.startIndex])
        print(name.endIndex)
    }
    
}
