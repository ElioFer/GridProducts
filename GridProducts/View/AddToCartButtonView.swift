//
//  AddToCartButtonView.swift
//  GridProducts
//
//  Created by Elio Fernandez on 01/03/2024.
//

import Foundation
import SwiftUI

struct AddToCartButtonView: View {
    
    var product: ProductModel
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: "cart.badge.plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0, height: 40.0)
                    .padding(.leading)
                
                Text("Add to cart")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
            }
            .foregroundColor(.black)
            .background(product.stock == 0 ? Color.gray : Color.mint) // If stock = 0 change to gray
            .cornerRadius(15)
            .shadow(radius: 2)
            .padding(.bottom, 40.0)
        }
        .disabled(product.stock == 0)
    }
}
