//
//  ViewController.swift
//  onlineShop
//
//  Created by Madiyar Zhenis on 05.06.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    static let cellReuseIdentifier = "collectionCell"
    
    private var items: [ItemModel] = Items.allItems
        
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Items"
        label.font = UIFont(name: "Manrope", size: 25)
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.add(infoLabel, {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(30)
        })
        
        view.add(collectionView, {
            $0.top.equalTo(infoLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(UIScreen.main.bounds.width)
        })
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellReuseIdentifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(item: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.item]
        let detailViewController = ItemDetailPageViewController(item: selectedItem)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

