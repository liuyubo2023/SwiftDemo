//
//  ViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/9/23.
//  Copyright © 2018年 yubo liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,ThirdViewDelegate {
    @IBOutlet weak var tableView: UITableView!
//    private let defalutIndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "首页"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        tableView.rx.contentOffset
            .map { $0.y }
            .subscribe(onNext: {
                print("contentOffset.x = \($0)")
            })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let vc = Single.shared.vc {
            print("has")
        } else {
            print("nil")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let vc = Single.shared.vc {
            print("has")
        } else {
            print("nil")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titlesArray().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.titlesArray()[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        switch indexPath.row {
        case 0:
            let firstVC = FirstViewController()
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 1:
            let secondVC = SecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        case 2:
            let thirdVC = ThirdViewController()
            thirdVC.delegate = self
            self.navigationController?.pushViewController(thirdVC, animated: true)
        case 3:
            let fourthVC = FourthViewController()
            fourthVC.closer = {
                print($0)
            }
            self.navigationController?.pushViewController(fourthVC, animated: true)
        case 4:
            let fifthVC = FifthViewController()
            self.navigationController?.pushViewController(fifthVC, animated: true)
        case 5:
            let RXVC = RxSwiftViewController()
            if let _ = Single.shared.vc {
                print("has")
            } else {
                print("nil")
            }
            self.navigationController?.pushViewController(RXVC, animated: true)
        case 6:
            let RXTA = RxTableViewController()
            self.navigationController?.pushViewController(RXTA, animated: true)
        default:
            break
        }
    }
    
    func titlesArray() -> NSArray {
        return ["第一行","第二行","第三行","第四行","测试UI","RXSwift","RXTableView"]
    }
    
    func printName(name: String) {
        print(name)
    }
}

