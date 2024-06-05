//
//  CollectionViewCell.swift
//  onlineShop
//
//  Created by Madiyar Zhenis on 05.06.2024.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
        
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
     let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope", size: 18)
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadow()
        
        add(imageView, {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(150)
        })
        
        add(subtitleLabel, {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview().inset(10)
            
        })
    }
    
    func configure(item: ItemModel){
        subtitleLabel.text = item.name
        imageView.image = item.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
