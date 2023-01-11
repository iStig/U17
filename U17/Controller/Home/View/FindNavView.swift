//
//  FindNavView.swift
//  U17
//
//  Created by 章建明 on 2022/8/21.
//

import UIKit

class FindNavView: UIView {
    private let MaxValue: CGFloat = (screenWidth - 20)/2//185

    
    private lazy var whiteView: UIView = {
        let v = UIView()
        return v
    }()
    
    private lazy var msgBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "sep_Message_White"), for: .normal)
        return btn
    }()
    
    private lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "classify_search_btn"), for: .normal)
        btn.setTitle(" 镇魂街", for: .normal)
        //btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.titleLabel?.textAlignment = NSTextAlignment.left
        btn.backgroundColor = UIColor(r: 1, g: 1,b: 1,a: 0.5)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private lazy var stackView : UIStackView = {
        let v = UIStackView()
        v.spacing = 10
        v.alignment = .fill
        v.distribution = .fillEqually
        return v
    }()
    
    private lazy var topBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "home_1_default"), for: .normal)
        btn.setTitle("排行", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        return btn
    }()
    private lazy var VIPBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "home_2_default"), for: .normal)
        btn.setTitle("VIP", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        return btn
    }()
    private lazy var subscibeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "home_3_default"), for: .normal)
        btn.setTitle("订阅", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        return btn
    }()
    private lazy var classifyBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "home_4_default"), for: .normal)
        btn.setTitle("分类", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        return btn
    }()
    
    public var defaultSearch: String? {
        didSet {
            if let defaultSearch = defaultSearch {
                searchBtn.setTitle(" " + defaultSearch , for: .normal)
            }
        }
    }
    
    private var defaultValue: CGFloat = 0
    private var selfDefaultHeight: CGFloat = 0

    public var value: CGFloat?{
        didSet {
            self.layoutIfNeeded()
            
            if let value = value {
//                print("didSet:", value)
                if defaultValue == 0 {
                    // 设置默认值
                    defaultValue = value
                    selfDefaultHeight = self.frame.size.height
//                    print("设置默认值:", defaultValue)
//                    print("自身高度:", selfDefaultHeight)
                } else {
                    var changeValue = (-defaultValue)-(-value)
                    if changeValue < 0 {
                        changeValue = 0
                    }

                    print("changeValue:", changeValue)
                    
                    if changeValue >= 0 && changeValue < 105 {
                        //调整self高度
                        self.snp.updateConstraints { (make) in
                            make.height.equalTo(selfDefaultHeight - changeValue/3) //value > 85 && < 120
                        }
                    }

                    if changeValue > MaxValue {
                        //调整self高度
                        self.snp.updateConstraints { (make) in
                            make.height.equalTo(selfDefaultHeight - 105/3)//120 - 35 = 85
                        }
                        //调整stackview位置
                        stackView.snp.updateConstraints { (make) in
                            make.top.equalTo(searchBtn.snp_bottom).offset(10 - 90/2)// -35
                            make.width.equalTo(screenWidth - 40 - MaxValue)//390 - 40 - 185 = 165
                        }

                        changeValue = MaxValue
                    }

                    if changeValue > 100 {//理解
                        searchBtn.backgroundColor = UIColor.init(red: 236/255, green: 236/255, blue: 236/255, alpha: changeValue/100)
                        msgBtn.setImage(UIImage(named: "sep_Message_Bubble"), for: .normal)
                    } else {
                        msgBtn.setImage(UIImage(named: "sep_Message_White"), for: .normal)
                        searchBtn.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
                    }
                    
                    if changeValue <= 30 {//理解
                        topBtn.setTitle("排行", for: .normal)
                        VIPBtn.setTitle("VIP", for: .normal)
                        subscibeBtn.setTitle("订阅", for: .normal)
                        classifyBtn.setTitle("分类", for: .normal)
                        
                        topBtn.setImage(UIImage(named: "home_1_default"), for: .normal)
                        VIPBtn.setImage(UIImage(named: "home_2_default"), for: .normal)
                        subscibeBtn.setImage(UIImage(named: "home_3_default"), for: .normal)
                        classifyBtn.setImage(UIImage(named: "home_4_default"), for: .normal)
                    } else {
                        topBtn.setTitle("", for: .normal)
                        VIPBtn.setTitle("", for: .normal)
                        subscibeBtn.setTitle("", for: .normal)
                        classifyBtn.setTitle("", for: .normal)
                        
                        topBtn.setImage(UIImage(named: "home_1"), for: .normal)
                        VIPBtn.setImage(UIImage(named: "home_2"), for: .normal)
                        subscibeBtn.setImage(UIImage(named: "home_3"), for: .normal)
                        classifyBtn.setImage(UIImage(named: "home_4"), for: .normal)
                    }
                    
                    
                    //调整stackview位置
                    if changeValue >= 0 && changeValue <= 90.0 {
                        stackView.snp.updateConstraints { (make) in
                            make.top.equalTo(searchBtn.snp_bottom).offset(10 - changeValue/2)// > -35
                            make.width.equalTo(screenWidth - 40 - changeValue)//260 - 350
                        }
                    } else if changeValue >= 0 && changeValue <= MaxValue {
                        stackView.snp.updateConstraints { (make) in
                            make.top.equalTo(searchBtn.snp_bottom).offset(10 - (90/2))//-35
                            make.width.equalTo(screenWidth - 40 - changeValue) //260 - 165
                        }
                    }

                    if value > defaultValue {
                        // 往上推
//                        self.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: changeValue/100)
                        backgroundColor = .red
                        
                        if changeValue <= MaxValue {
                            searchBtn.snp.updateConstraints({ (make) in
                                make.width.equalTo(screenWidth - 85 - changeValue)
                            })
                        }
                    }
                    if value <= defaultValue {
                        // 往下推
//                        self.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: changeValue/100)
                        backgroundColor = .red
                        
                        var width: CGFloat = searchBtn.frame.size.width + changeValue
                        if changeValue <= 0 {
                            width = screenWidth - 85
                        }
                        searchBtn.snp.updateConstraints({ (make) in
                            make.width.equalTo(width)
                        })
                    }

                }
            }
        }

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = .red
        addSubview(msgBtn)
        msgBtn.snp.makeConstraints { make in
            make.top.equalTo(44)
            make.left.equalTo(20)
            make.width.height.equalTo(25)
        }
        
        addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.left.equalTo(65)
            make.height.equalTo(35)
            make.width.equalTo(screenWidth - 85)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp_bottom).offset(10)
            make.right.equalTo(-20)
            make.height.equalTo(35)
            make.width.equalTo(screenWidth - 40)
        }
        
        stackView.addArrangedSubview(topBtn)
        stackView.addArrangedSubview(VIPBtn)
        stackView.addArrangedSubview(subscibeBtn)
        stackView.addArrangedSubview(classifyBtn)
    }
}
