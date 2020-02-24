//
//  CurvedTabBarController.swift
//  CurvedTabBar
//
//  Created by LE Duc Huy on 2/21/20.
//  Copyright © 2020 LE Duc Huy. All rights reserved.
//

import UIKit

class EmptyController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.clear
    }
}

class CurvedTabBarController: UITabBarController {
    
    lazy var middleButton = UIButton.init(frame: CGRect.zero)
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.selectedIndex = 2
//        self.selectedIndex = 0
//    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        
        let buttonWidth: CGFloat = 60
        let buttonHeight: CGFloat = 60
        
        let x = UIScreen.main.bounds.width / 2 - buttonWidth/2
        let y = tabBar.frame.origin.y - buttonHeight/2 - view.safeAreaInsets.bottom
                
        middleButton.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myProfileController = FriendRequestsController()
        let nc = UINavigationController(rootViewController: myProfileController)
        //        nc.configNavColor(UIColor(red: 51/255, green: 90/255, blue: 149/255, alpha: 1))
        nc.title = "News Feed"
        nc.tabBarItem.image = UIImage.init(systemName: "doc.text")
        self.delegate = self
        
        let accountController = OtherController()
        accountController.view.backgroundColor = UIColor.blue
        let secondNC = UINavigationController(rootViewController: accountController)
        secondNC.title = "Requests"
        secondNC.tabBarItem.image = UIImage.init(systemName: "person.badge.plus")
        
        let accountController1 = ViewController()
        accountController1.view.backgroundColor = UIColor.blue
        let secondNC1 = UINavigationController(rootViewController: accountController1)
        secondNC1.title = "Requests"
        secondNC1.tabBarItem.image = UIImage.init(systemName: "person.badge.plus")
        
        
        let accountController2 = ViewController()
        accountController2.view.backgroundColor = UIColor.blue
        let secondNC2 = UINavigationController(rootViewController: accountController1)
        secondNC2.title = "Requests"
        secondNC2.tabBarItem.image = UIImage.init(systemName: "person.badge.plus")
        
        let accountController3 = EmptyController()
        accountController3.view.backgroundColor = UIColor.white
        
        //        secondNC2.title = "Requests"
        //        secondNC2.tabBarItem.image = UIImage.init(systemName: "person.badge.plus")
        
        viewControllers = [nc, secondNC, accountController3, secondNC1, secondNC2]
        
        //        let topBorder = CALayer()
        //        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        //        topBorder.backgroundColor = CGColor.init(srgbRed: 255/255, green: 1/255, blue: 1/255, alpha: 1)
        //
        //        tabBar.layer.addSublayer(topBorder)
        //tabBar.clipsToBounds = true
        setupMiddleButton()

    }
    
    func setupMiddleButton() {
        ////        self.view.layoutIfNeeded()
        
        middleButton.layer.cornerRadius = 30
        middleButton.backgroundColor = UIColor.init(hexString: "#ff7289")
        
        middleButton.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium)
        middleButton.setImage(UIImage(systemName: "plus", withConfiguration: symbolConfig), for: .normal)
        middleButton.tintColor = .white
        
        self.view.addSubview(middleButton)
        self.tabBar.sendSubviewToBack(middleButton)
    }
    
    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        print("middle selected")
    }
    
    
}

extension CurvedTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: EmptyController.self) {
            return false
        }
        return true
    }
}

