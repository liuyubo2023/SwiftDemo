//
//  SecondViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/1.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第二个"
        view.backgroundColor = UIColor.white
        
        print(greet(person: "yubo", address: "yanan"))
        //        let bounds = minArr(array: [8, -6, 23, 90, 45])
        //        print("min = \(bounds.min) max = \(bounds.max)")
        if let bounds = minArr(array: [8, -6, 23, 90, 45]) {
            print("min = \(bounds.min) max = \(bounds.max)")
        }
        
        var vga = Resolution(width: 20, height:50)
        vga.height = 40
        print("vga = \(vga.width) -- \(vga.height)")
        
        let Cu = Cuboid(width: 12, height: 15, depth: 18)
        print("Cuboid = \(Cu.volume)")
        
        let white = Color(white: 20)
        print("white = \(white.red)")
        
        package()
        
    }
    
    func greet(person: String, address: String) -> String {
        return "\(address) is \(person)"
    }
    
    func minArr(array:[Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return(currentMin, currentMax)
    }
    
    struct Resolution {
        var width : Int
        var height : Int {
            willSet (newHeight) {
                print("willset")
            }
        }
    }
    
    struct Color {
        var red, green, blue: Double
        init(red: Double, green: Double, blue: Double) {
            self.red   = red
            self.green = green
            self.blue  = blue
        }
        init(white: Double) {
            red   = white
            green = white
            blue  = white
        }
    }
    
    struct Cuboid {
        var width = 0.0, height = 0.0, depth = 0.0
        var volume: Double {
            return width * height * depth
        }
    }
    
    func package() {
        
        var ab : String?
        print(ab?.lowercased() as Any)
        
        var aString:String? = "aTest"
        print(aString!) //  Testttttttttt   - 强制解包
        print(aString)  // Optional("Testttttttttt")
        
        var bString:String! = "bTest"
        print(bString!)
        print(bString)
        
        // 可选绑定
        var cString:String?
        if let str = cString {
            print(cString!)
        } else {
            print("aString have no value")
        }
        
        var re : Resolution! = Resolution(width: 20, height: 30)
        print(re?.width)
        print(re.height)
    }
}
