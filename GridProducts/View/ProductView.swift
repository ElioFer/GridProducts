//
//  ProductView.swift
//  GridProducts
//
//  Created by Elio Fernandez on 27/02/2024.
//

import SwiftUI

struct ProductView: View {
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: numberOfColumns) {
                    ForEach(viewModel.products , id: \.sku) { product in
                        VStack {
                            FrameProductView(imageName: product.image, productName: product.name, productPrice: product.price, productStock: product.stock)
                            
                            AddToCartButtonView(product: product) {
                                viewModel.addToCart(product: product, quantity: 1)
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing: cartButton)
            .navigationBarTitle("Products")
        }
    }
    
    private var cartButton: some View {
        if !viewModel.cart.isEmpty {
            return AnyView(
                NavigationLink(destination: CartView().environmentObject(viewModel)) {
                    HStack {
                        Text("Go to cart")
                            .font(.headline)
                            .fontWeight(.regular)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    }
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

#Preview {
    ProductView()
}
