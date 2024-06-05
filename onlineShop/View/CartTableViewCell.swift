//
//  CartTableViewCell.swift
//  onlineShop
//
//  Created by Takhmina Zhenis on 05.06.2024.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let identifier = "CartTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, quantityLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(with cartItem: CartItem) {
        nameLabel.text = cartItem.item.name
        priceLabel.text = "Price: \(cartItem.item.price)"
        quantityLabel.text = "Quantity: \(cartItem.quantity)"
    }
}
