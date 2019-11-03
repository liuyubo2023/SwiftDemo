//
//  SecondViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/1.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import UIKit

struct Student {    
    var chinese : Int
    var math : Int
    var english : Int
    
    init(stringScore: String) {
        let cme = stringScore.characters.split(separator: ",")
        chinese = Int(atoi(String(cme.first!)))
        math = Int(atoi(String(cme[1])))
        english = Int(atoi(String(cme.last!)))
    }
}

class SecondViewController: UIViewController {
    
    enum Name : CaseIterable {
        case tom
        case tony
        case ybo
    }
    
    enum Test {
        case north(String) //关联值
        case west
        case east
    }
    
    enum DetailViewImages: String {
        case Background = "bg1.png"
        case Sidebar = "sbg.png"
        case ActionButton1 = "btn1_1.png"
        case ActionButton2 = "btn2_1.png"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptyView = UIView.init(frame: .zero)
        view.addSubview(emptyView)
        let redView = RedView()
        emptyView.addSubview(redView)
        
        let stu = Student(stringScore: "89,90,91")
        
        print(DetailViewImages.Background)
        
        // Enums
        enum Ex { case Mode(ab: Int, cd: Int) }
        if case Ex.Mode(let ab, let cd) = Ex.Mode(ab: 4, cd: 5) {
            print(ab+cd)
        }
        
        // vs tuples:
        let tp = (ab: 4,cd : 4)
        print(tp.ab)
        
        var name = Name.tom
        name = .ybo
        let nameCount = Name.allCases.count
        
        let te = Test.north("copy")
        let enu = te
        switch te {
        case .north(let cooo):  //取出关联值
            print(cooo)
        default:
            ()
        }
        
        if case .north(let cname) = te {
            print(cname)
        }
        
        print("enu\(enu)")
        
        
        title = "第二个"
        view.backgroundColor = UIColor.white
        
        let array = [1,2,3,4,6];
        let array2 = array.filter({$0 > 1}).map({$0 * 2})
        print(array2)
        
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
        
        let color1 = CSSColor.named(.red)
        let color2 = CSSColor.rgb(0xAA, 0xAA, 0xAA)
        print("color1 = \(color1), color2 = \(color2)") // prints color1 = red, color2 = #AAAAAA
        let color3 = CSSColor.init(gray: 0xAA)
        print("color3 = \(color3)")  // print color3 = #AAAAAA
    }
    
    override var traitCollection: UITraitCollection {
        return UITraitCollection.init(horizontalSizeClass: .unspecified)
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

enum ColorName: String {
    case black
    case silver
    case gray
    case white
    case maroon
    case red
    // ... and so on ...
}

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}

extension CSSColor: CustomStringConvertible {
    var description: String {
        switch self {
        case .named(let colorName):
            return colorName.rawValue
        case .rgb(let red, let green, let blue):
            return String(format: "#%02X%02X%02X", red,green,blue)
        }
    }
}

extension CSSColor {
    init(gray: UInt8) {
        self = .rgb(gray, gray, gray)
    }
}

