//
//  CollectionViewCell.swift
//  SwiftLearnDemo
//
//  Created by apple on 4/13/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        titleLabel.frame = contentView.frame
    }
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
}
