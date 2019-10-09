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
    typealias Add = (_ num1: Int, _ num2: Int) -> (Int)
    
    override func viewDidLoad() {
        self.title = "第一个类"
        self.view.backgroundColor = UIColor.white
        
        let kName = "this is let name"
        print(kName.startIndex)
        
        let addCloser : Add
        
        addCloser = {
            (_ num1: Int, _ num2: Int) -> (Int) in
            return num1 + num2
        }
        let result = addCloser(2,5)
        
        var dic : [String : Any] = ["dic" : "dic", "name" : 3]
        if #available(iOS 10, *) {
            
        } else {
            
        }
        
        
        let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        
        print(softWrappedQuotation)
        
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
        
//        stringIndex()
//        setDemo()
        package()
        
        var cool = UIColor.red
    }
    
    func isObjEqual<T:Equatable>(x: T,y: T) -> Bool {
        return x == y;
    }
    
    func stringIndex() {
        let name = "userDefault"
        
        print(name[name.startIndex])
        print(name.endIndex)
    }
    
    func setDemo() {
        var array = [Int]()
        var array1:[Int] = [2,4,6]
        var array2 = Array(repeating: 4, count: 5)
        for item in array1 {
            print(item)
        }
        
        var setArray = Set<String>()
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        
        var dic = [Int: String]()
        // namesOfIntegers 现在包含一个键值对
        dic[16] = "sixteen"
        // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
        dic = [:]
        
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    }
    
    func package() {
        var aString : String? = "Test"
        print(aString!)
        print(aString)
        
        var bString:String! = "Testttttttttt"
        print(bString!)
        print(bString)
    }
}

func compareVersion(_ version1 : String) {
    version1.reversed()
}
