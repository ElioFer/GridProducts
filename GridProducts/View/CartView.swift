//
//  CartView.swift
//  GridProducts
//
//  Created by Elio Fernandez on 29/02/2024.
//

import Foundation
import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.cart, id: \.sku) { product in
                        VStack {
                            HStack {
                                Image(systemName: product.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                
                                Text(product.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text("Qty: \(viewModel.cartQuantity[product.sku] ?? 0)")
                                    .font(.subheadline)
                            }
                            
                            HStack {
                                Spacer()
                                
                                Text("Subtotal: \(viewModel.calculateSubtotal(product: product))")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Total: \(viewModel.calculateTotal())")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationTitle("My Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(ProductViewModel())
    }
}

