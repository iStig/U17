//
//  MineVC.swift
//  U17
//
//  Created by 章建明 on 2022/8/8.
//

import UIKit
import SnapKit
//import HandyJSON
//import Reusable


class MineVC: BaseController {
    private let headHeight: CGFloat = 300

    private lazy var titleArray: Array = {
        return [["icon":"sep_register","title":"签到"],
                ["icon":"sep_mywallet", "title": "钱包"],
                ["icon":"sep_subscription", "title": "订阅"],
                ["icon":"sep_fengyintu", "title": "封印图"],
                ["icon":"sep_theme", "title": "皮肤"],
                ["icon":"myvotebiao", "title": "我的投票"],
                ["icon":"sep_help", "title": "帮助反馈"],
                ["icon":"sep_beijing", "title": "首都网警"],
                ["icon":"sep_auther", "title": "作者中心"],
                ["icon":"sep_setting", "title": "设置"],
                ["icon":"sep_register","title":"签到"],
                ["icon":"sep_mywallet", "title": "钱包"],
                ["icon":"sep_subscription", "title": "订阅"],
                ["icon":"sep_fengyintu", "title": "封印图"],
                ["icon":"sep_theme", "title": "皮肤"],
                ["icon":"myvotebiao", "title": "我的投票"],
                ["icon":"sep_help", "title": "帮助反馈"],
                ["icon":"sep_beijing", "title": "首都网警"],
                ["icon":"sep_auther", "title": "作者中心"],
                ["icon":"sep_setting", "title": "设置"]]
    }()
    
    private lazy var collectionView : UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true;//contentsize 小于 bounds也能滑动
        return collectionView
    }()
    
    private lazy var head: MineHeaderView = {
        let head = MineHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: headHeight))
        return head
    }()
    
    private lazy var navigationBarY:CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.clear)
        collectionView.contentOffset = CGPoint(x: 0, y: -collectionView.parallaxHeader.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
    
    override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.snp_edges).priority(.low)
        }
        collectionView.register(cellType: MineCollectionViewCell.self)
        collectionView.parallaxHeader.view = head
        collectionView.parallaxHeader.height = headHeight
        collectionView.parallaxHeader.minimumHeight = navigationBarY
//        collectionView.parallaxHeader.mode = .fill
        collectionView.parallaxHeader.parallaxHeaderDidScrollHandler = { (a) in
//            print("progress : \(a.progress)")
        }
        
    }

}

//UICollectionViewDelegateFlowLayout :UICollectionViewDelegate : UIScrollViewDelegate

extension MineVC : UICollectionViewDataSource,
                   UICollectionViewDelegateFlowLayout {
    
    //UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MineCollectionViewCell.self)
        cell.dict = titleArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(UIScreen.main.bounds.width-10*2-10*2)/3)
        let height = Double(width*0.75 + 30)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("contentoffset \(scrollView.contentOffset.y) ,contentInset.top \(scrollView.contentInset.top)")
        
        if scrollView.contentOffset.y >= -(scrollView.parallaxHeader.minimumHeight) {
            navigationController?.barStyle(.theme)
            navigationItem.title = "我的"
        } else {
            navigationController?.barStyle(.clear)
            navigationItem.title = ""
        }
    }
    
}
