//
//  LoginViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/27.
//  Copyright © 2018 yubo liu. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController:  UIViewController{
    
    var closer : ((String) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.green
        view.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let demo = UserDefaults.standard.object(forKey: "right")
        if (demo != nil) {
            print("OK")
        }
        
        let usernameTextfiled = UITextField(frame: CGRect(x: -270, y: 100, width: view.frame.width - 100, height: 40))
        usernameTextfiled.placeholder = "username"
        usernameTextfiled.borderStyle = .roundedRect
        self.view.addSubview(usernameTextfiled)
        
        let passwordTextfiled = UITextField(frame: CGRect(x: -270, y: 160, width: view.frame.width - 100, height: 40))
        passwordTextfiled.placeholder = "username"
        passwordTextfiled.borderStyle = .roundedRect
        passwordTextfiled.isSecureTextEntry = true
        self.view.addSubview(passwordTextfiled)
        
        let loginButton = UIButton(frame: CGRect(x: -200, y: 220, width: self.view.frame.width - 200, height: 40))
        loginButton.setTitle("Login", for: UIControl.State.normal)
        loginButton.backgroundColor = UIColor(red: 22/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1)
        loginButton.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)
        self.view.addSubview(loginButton)
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }
        
        // duration：  动画时长
        // delay：  决定了动画在延迟多久之后执行
        // options：用来决定动画的展示方式，接下来会进行讲解
        // animations：转化成动画表示的代码
        // completion：动画结束后执行的代码块
        // dampingRatio：速度衰减比例。取值范围0 ~ 1，值越低震动越强
        // velocity：初始化速度，值越高则物品的速度越快
        UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            usernameTextfiled.center.x = self.view.center.x
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .allowAnimatedContent, animations: {
            
        }, completion: { (num) in
            
        })
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            passwordTextfiled.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            loginButton.center.x = self.view.center.x
        }) { (isComplete) in
            
            //           usingSpringWithDamping: 0-1, the less the more exaggerate
            //           initialSpringVelocity: the bigger the faster init speed
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options:.allowAnimatedContent, animations: {
                loginButton.frame.size.width = self.view.frame.width - 120
                loginButton.center.x = self.view.center.x
            }, completion: nil)
        }
    }
}

extension LoginViewController {
    @objc func back()  {
        if closer != nil {
            closer!("name")
        }
        navigationController?.popViewController(animated: true)
    }
}
