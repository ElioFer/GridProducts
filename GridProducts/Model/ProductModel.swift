//
//  ProductModel.swift
//  GridProducts
//
//  Created by Elio Fernandez on 28/02/2024.
//

import Foundation

struct ProductModel {
    let sku: Int
    var stock: Int
    let name: String
    let price: Double
    let image: String
}

let shop = [
    ProductModel(sku: 163536, stock: 12, name: "Baseball Ball", price: 29.00, image: "baseball"),
    ProductModel(sku: 225253, stock: 10, name: "Soccer Ball", price: 19.99, image: "soccerball"),
    ProductModel(sku: 308332, stock: 3, name: "Basketball Ball", price: 39.99, image: "basketball"),
    ProductModel(sku: 493897, stock: 1, name: "Football Ball", price: 24.99, image: "football"),
    ProductModel(sku: 524444, stock: 0, name: "Tennis Racket", price: 18.99, image: "tennis.racket"),
    ProductModel(sku: 639937, stock: 26, name: "Tennis Ball", price: 25.99, image: "tennisball"),
    ProductModel(sku: 743000, stock: 2, name: "Volleyball Ball", price: 35.00, image: "volleyball"),
    ProductModel(sku: 809223, stock: 1, name: "Trophies", price: 33.99, image: "trophy"),
    ProductModel(sku: 877737, stock: 2, name: "Skateboard", price: 99.99, image: "skateboard"),
    ProductModel(sku: 782787, stock: 24, name: "Gym Bag", price: 25.00, image: "gym.bag")
]

