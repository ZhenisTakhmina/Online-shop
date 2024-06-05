//
//  ItemDetailPageViewController.swift
//  onlineShop
//
//  Created by Takhmina Zhenis on 05.06.2024.
//

import UIKit
import SnapKit

final class ItemDetailPageViewController: UIViewController {
    
    private let item: ItemModel
    private var currentItem: ItemModel?
    
    
    init(item: ItemModel) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-Bold", size: 25)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        imageView.layer.shadowRadius = 4
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-SemiBold", size: 20)
        label.textColor = .systemGreen
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Manrope-Regular", size: 18)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    private let buyNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy Now", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buyNowButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to Cart", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buyNowButton, addToCartButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configure(with: item)
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        view.add(imageView, {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(150)
            $0.width.equalTo(150)
            $0.height.equalTo(250)
        })
        
        view.add(titleLabel, {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        })
        
        view.add(priceLabel, {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
        })
        
        view.add(descriptionLabel, {
            $0.top.equalTo(priceLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
        })
        
        view.add(buttonStackView, {
            $0.bottom.equalToSuperview().inset(40)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        })
    }
    
    func configure(with item: ItemModel) {
        currentItem = item
        imageView.image = item.image
        titleLabel.text = item.name
        priceLabel.text = "Price: \(item.price) tg"
        descriptionLabel.text = "Description: \n \(item.description)"
    }
    
    @objc private func addToCartButtonTapped() {
        guard let item = currentItem else { return }
        CartManager.shared.addToCart(item: item)
        let viewController = CartViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func buyNowButtonTapped() {
        let vc = AddCardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

