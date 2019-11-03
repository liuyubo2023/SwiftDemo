//
//  PageTitleConfigure.swift
//  SwiftDemo
//
//  Created by liuyubo on 2019/10/10.
//  Copyright © 2019 yubo liu. All rights reserved.
//

import Foundation
import UIKit

final class PageTitleConfigure: NSObject {
    // 是否需要弹性效果，默认为false
    var bounces = false
    // 静止样式下标题是否均分布局，默认为 true
    var equivalence = true
    // 是否显示底部分割线，默认为 YES
    var showBottomSeparator = true
    // 底部分割线颜色，默认为 lightGrayColor
    var bottomSeparatorColor = UIColor.lightGray
    // 标题文字字号大小，默认 15 号字体
    var titleFont = UIFont.systemFont(ofSize: 15)
    // 标题文字选中字号大小，默认 15 号字体
    var titleSelectedFont = UIFont.boldSystemFont(ofSize: 15)
    // 普通状态下标题文字的颜色，默认为黑色
    var titleColor = UIColor.black
    // 选中状态下标题文字的颜色，默认为红色
    var titleSelectedColor = UIColor.red
    // 标题额外增加的宽度，默认为 20.0f
    var titleAdditionalWidth: CGFloat = 20.0
    // 是否显示指示器，默认为 true
    var showIndicator = true
    // 指示器颜色，默认为红色
    var indicatorColor = UIColor.red
    // 指示器高度，默认为 2.0f 
    var indicatorHeight: CGFloat = 2.0
    // 指示器宽度，默认为 2.0f 
    var indicatorWidth: CGFloat = 20.0
    // 是否显示标题间分割线，默认为 true
    var showVerticalSeparator = true
    // 标题间分割线颜色，默认为红色
    var verticalSeparatorColor = UIColor.lightGray
    // 标题间分割线额外减少的高度，默认为 0.0f
    var verticalSeparatorReduceHeight: CGFloat = 0.0
}
