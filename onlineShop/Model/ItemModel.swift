//
//  ItemModel.swift
//  onlineShop
//
//  Created by Takhmina Zhenis on 05.06.2024.
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
    static let item1: ItemModel = .init(id: 1, name: "English Course", price: 45000, description: "Empower your sales prowess with our intensive English communication course. Learn to craft compelling pitches, engage clients effectively, and close deals with confidence. Led by seasoned experts, this course provides practical skills and strategies to excel in sales and beyond. Join us and elevate your communication game to drive success in your sales career.", image: UIImage(named: "english")!)
    static let item2: ItemModel = .init(id: 2, name: "T-shirt", price: 5000, description: "A comfortable and stylish T-shirt.Express yourself with our exclusive 'Speak Your Style: English Edition' t-shirt! Crafted for language lovers and fashion enthusiasts alike, this tee celebrates the beauty of English language and literature. Featuring iconic quotes from classic and contemporary works, this shirt is a testament to the power of words.", image: UIImage(named: "tshirt")!)
    
    static let allItems: [ItemModel] = [item1, item2]
}
