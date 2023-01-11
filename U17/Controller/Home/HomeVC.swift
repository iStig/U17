//
//  HomeVC.swift
//  U17
//
//  Created by 章建明 on 2022/8/8.
//

import UIKit

class HomeVC: BaseController {

    private lazy var navView: FindNavView = {
        let nav = FindNavView()
        return nav
    }()
    
    private lazy var bannerView: LLCycleScrollView = {
        let banner = LLCycleScrollView()
        banner.backgroundColor = UIColor.green
        return banner
    }()
    
    private lazy var collectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.minimumLineSpacing = 5 //vertical : item上下间距
        lt.minimumInteritemSpacing = 5//vertical : item左右间距
        lt.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: lt)
        collectionView.backgroundColor = .white
        collectionView.register(cellType: ComicCollectionViewCell.self)
        collectionView.register(cellType: BoardCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
//        colletionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: screenHeight/2.0, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        return collectionView
    }()
    
    var style: UIStatusBarStyle = .lightContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    
    override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(collectionView.contentInset.top)
        }
        
        view.addSubview(navView)
        navView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
    }
}


extension HomeVC: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ComicCollectionViewCell.self), for: indexPath)
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ComicCollectionViewCell.self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 30.0) / 3.0)
        return  CGSize(width: width, height: width*1.75)
    }
    
    //UICollectionViewDelegateFlowLayout section 边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
        navView.value = scrollView.contentOffset.y
        
        
        if scrollView == collectionView {
            print("offset.y:",scrollView.contentOffset.y,"scrollView.contentInset.top",scrollView.contentInset.top)

            bannerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(min(0, -(scrollView.contentOffset.y + scrollView.contentInset.top)))
            }
        }
    }
    
    
}
