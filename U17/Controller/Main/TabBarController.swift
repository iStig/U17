//
//  TabBarController.swift
//  U17
//
//  Created by 章建明 on 2022/8/8.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        //社区
        let communityVC = CommunityVC()
        addChildController(communityVC, title: "社区", image: UIImage(named: "tab_today"), selectedImage: UIImage(named: "tab_today_selected"))
        
        //发现
        let homeVC = HomeVC()
        addChildController(homeVC, title: "发现", image: UIImage(named: "tab_find"), selectedImage:  UIImage(named: "tab_find_selected"))
        
        //书架
        let bookrackVC = BookrackVC()
        addChildController(bookrackVC, title: "书架", image: UIImage(named: "tab_book"), selectedImage: UIImage(named: "tab_book_selected"))
        
        let mineVC = MineVC()
        addChildController(mineVC, title: "我的", image: UIImage(named: "tab_mine"), selectedImage: UIImage(named: "tab_mine_selected"))
        
    }
    
    func addChildController(_ childController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) {
        let normalImage = image?.withRenderingMode(.alwaysOriginal)
        let highlightImage = selectedImage?.withRenderingMode(.alwaysOriginal)
//        let normalImage = image
//        let highlightImage = selectedImage
//        let normalImage = image?.withRenderingMode(.alwaysTemplate)
//        let highlightImage = selectedImage?.withRenderingMode(.alwaysTemplate)
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil, image: normalImage, selectedImage: highlightImage)
        
        //图片整体下移6像素
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        addChild(NaviController(rootViewController: childController))
    }
    
}
