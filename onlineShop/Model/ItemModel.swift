//
//  ItemModel.swift
//  onlineShop
//
//  Created by Madiyar Zhenis on 05.06.2024.
//

import Foundation
import UIKit

struct ItemModel {
    let id: Int
    let name: String
    let price: Double
    let description: String
    let image: UIImage
    
    init(id: Int, name: String, price: Double, description: String, image: UIImage) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.image = image
    }
}

struct Items {
    static let item1: ItemModel = .init(id: 1, name: "English Course", price: 45000, description: "A comprehensive English language course.", image: UIImage(named: "english")!)
    static let item2: ItemModel = .init(id: 2, name: "T-shirt", price: 5000, description: "A comfortable and stylish T-shirt.", image: UIImage(named: "tshirt")!)
    
    static let allItems: [ItemModel] = [item1, item2]
}
