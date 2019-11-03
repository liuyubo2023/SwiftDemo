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
    public var selectedIndex = 0
    
    private weak var delegate: PageTitleDelegate?
    private let titleNames: [String]
    private let configutation: PageTitleConfigure
    
    init(With frame: CGRect, delegate: PageTitleDelegate?, titleNames:[String], configutation: PageTitleConfigure) {
        self.titleNames = titleNames
        self.configutation = configutation
        super.init(frame: .zero)
        self.delegate = delegate
        self.setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - private method
extension PageTitleView {
    private func setupSubViews() {
        
    }
}

// MARK: - public method
extension PageTitleView {
    
}
