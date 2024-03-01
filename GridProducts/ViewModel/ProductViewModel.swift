//
//  ProductViewModel.swift
//  GridProducts
//
//  Created by Elio Fernandez on 28/02/2024.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = [] // List available products
    @Published var cart: [ProductModel] = [] // List cart products
    @Published var cartQuantity: [Int:Int] = [:] // Dictionary to track quantities in cart
    
    init() {
        products = shop
    }
    
    func addToCart(product: ProductModel, quantity: Int) {
        //Update stock
        if let index = products.firstIndex(where: { $0.sku == product.sku }) {
            products[index].stock -= quantity
        }
        
        if var existingQuantity = cartQuantity[product.sku] { // Check if the product is already in the cart
            existingQuantity += quantity
            cartQuantity[product.sku] = existingQuantity
        } else {
            cart.append(product)
            cartQuantity[product.sku] = quantity
        }
        
    }
    
    func calculateSubtotal(product: ProductModel) -> String {
        guard let quantity = cartQuantity[product.sku] else {
            return "N/A"
        }
        let subtotal = Double(quantity) * product.price
        return String(format: "%.2f", subtotal) + " $"
    }
    
    func calculateTotal() -> String {
        var total: Double = 0
        for product in cart {
            if let quantity = cartQuantity[product.sku] {
                total += Double(quantity) * product.price
            }
        }
        return String(format: "%.2f", total) + " $"
    }
}
