//
//  Single.swift
//  SwiftDemo
//
//  Created by liuyubo on 2019/10/17.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import Foundation
import UIKit

class Single: NSObject {
    weak var vc: UIViewController?
    
    static let shared = Single()
    private override init() {}
}
