//
//  PageTitleView.swift
//  SwiftDemo
//
//  Created by liuyubo on 2019/10/10.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import Foundation
import UIKit

protocol PageTitleDelegate: class {
    func pageTitleView(_ view: PageTitleView, selectedIndex: Int)
}

final class PageTitleView: UIView {
    private weak var delegate: PageTitleDelegate?
    
    init(With frame: CGRect,  configutation: PageTitleConfigure, delegate: PageTitleDelegate?) {
        super.init(frame: .zero)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
