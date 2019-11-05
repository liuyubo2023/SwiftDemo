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
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = true
        if !configutation.bounces {
            scrollView.bounces = false
        }
        return scrollView
    }()
    private lazy var bottomSeparator: UIView = {
        let bottomSeparator = UIScrollView()
        bottomSeparator.backgroundColor = configutation.bottomSeparatorColor
        return bottomSeparator
    }()
    private var allBtnWidth: CGFloat = 0.0
    private var btnArr = [UIButton]()
    private var vSeperatorArr = [UIView]()
    
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}

// MARK: - private method
extension PageTitleView {
    private func setupSubViews() {
        
    }
    
    private func setupTitleButtons() {
        let titleCount: CGFloat = CGFloat(titleNames.count)
        
        //  计算所有按钮的文字宽度
        allBtnWidth = titleNames.reduce(0) { $0 +  $1.widthOf(configutation.titleFont)}
        allBtnWidth = allBtnWidth + titleCount * configutation.titleAdditionalWidth
        allBtnWidth = CGFloat(ceilf(Float(allBtnWidth)))
        
        for (index, title) in titleNames.enumerated() {
            let button = UIButton()
            button.tag = index
            button.titleLabel?.font = configutation.titleFont
            button.titleLabel?.textAlignment = .center
            button.setTitle(title, for: .normal)
            button.setTitleColor(configutation.titleColor, for: .normal)
            button.setTitleColor(configutation.titleSelectedColor, for: .selected)
            button.addTarget(self, action: #selector(titleButtonAction(_:)), for: .touchUpInside)
            btnArr.append(button)
            scrollView.addSubview(button)
        }
        
        if configutation.showVerticalSeparator {
            for (index, _) in titleNames.enumerated() {
                if index != 0 {
                    let seperator = UIView()
                    seperator.backgroundColor = configutation.verticalSeparatorColor
                    vSeperatorArr.append(seperator)
                    scrollView.addSubview(seperator)
                }
            }
        }
    }
    
    private func p_layoutSubviews() {
        
    }
    
    @objc private func titleButtonAction(_ button: UIButton) {
        delegate?.pageTitleView(self, selectedIndex: button.tag)
    }
}

// MARK: - utils
extension String {
    fileprivate func widthOf(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}

// MARK: - public method
extension PageTitleView {
    
}
