//
//  FifthViewController.swift
//  SwiftDemo
//
//  Created by yubo liu on 2018/10/25.
//  Copyright © 2018 yubo liu. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        addLoginButton()
        addSignupButton()
        
        userDefaultsDemo()
    }
    
    func addLoginButton() {
        let loginButton = UIButton(frame: CGRect(x: 0, y: view.frame.height - buttonHeight, width: view.frame.width / 2.0, height: buttonHeight))
        loginButton.setTitle("Log in", for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(loginAction), for: UIControl.Event.touchUpInside)
        loginButton.backgroundColor = UIColor.blue
        self.view.addSubview(loginButton)
    }
    
    func addSignupButton() {
        let signupButton = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height - buttonHeight, width: view.frame.width / 2, height: buttonHeight))
        signupButton.setTitle("Sign up", for: UIControl.State.normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signupButton.backgroundColor = UIColor.brown
        view.addSubview(signupButton)
    }
    
    func userDefaultsDemo() {
        UserDefaults.standard.set(true, forKey: "right")
    }
    
    @objc func loginAction() {
        let vc : LoginViewController = LoginViewController()
        navigationController?.pushViewController(vc, animated:true)
    }
    
}
