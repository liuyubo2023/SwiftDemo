//
//  RxTablevViewController.swift
//  SwiftDemo
//
//  Created by liuyubo on 2019/10/13.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxTableViewController: UIViewController {
    
    private let tableView = UITableView()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 88, y: 0, width: self.view.bounds.size.width, height:  self.view.bounds.size.height)
        
        stringData()
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { _, name, cell in
                cell.textLabel?.text = name
        }.disposed(by: disposeBag)
        
//        tableView.rx.modelSelected(String)
//            .subsribeNext { name in
//                print("You selected \(name)")
//        }
//        .addDisposableTo(disposeBag)
//        tableView.rx.modelSelected(String)
//        .sub
        
    }
    
    func stringData() -> Observable<[String]> {
        let data = Observable.just([
            "anme","aflaj",""
        ])
        return data
    }
}
