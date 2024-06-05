//
//  CartManager.swift
//  onlineShop
//
//  Created by Madiyar Zhenis on 05.06.2024.
//

import Foundation

final class CartManager {
    static let shared = CartManager()
    private init() {}

    private(set) var items: [CartItem] = []

    func addToCart(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.item.id == item.id }) {
            items[index].quantity += 1
        } else {
            let newCartItem = CartItem(item: item, quantity: 1)
            items.append(newCartItem)
        }
    }
}
