//
//  RedView.swift
//  SwiftDemo
//
//  Created by liuyubo on 2019/10/20.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import Foundation
import UIKit

class RedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if frame.size.width == 0 || frame.size.height == 0 {
            frame = superview?.frame ?? .zero
        }
    }
    
}
