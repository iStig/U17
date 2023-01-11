//
//  MineCollectionViewCell.swift
//  U17
//
//  Created by 章建明 on 2022/8/9.
//

import UIKit
import SnapKit

class MineCollectionViewCell: BaseCollectionViewCell {
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    var dict: Dictionary<String, String>? {
        didSet {
            guard let dict = dict else{ return }
            iconView.image = UIImage(named: dict["icon"] ?? "")
            titleLabel.text = dict["title"]
        }
    }
    
    override func setupLayout() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(10)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.5)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(iconView.snp.bottom).offset(-15)
        }
    }
}
