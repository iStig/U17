//
//  BaseCollectionViewCell.swift
//  U17
//
//  Created by 章建明 on 2022/8/9.
//

import UIKit
import Reusable

class BaseCollectionViewCell: UICollectionViewCell, Reusable{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
    }
    
}
