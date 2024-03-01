//
//  ProductCellView.swift
//  GridProducts
//
//  Created by Elio Fernandez on 01/03/2024.
//
import Foundation
import SwiftUI

struct FrameProductView: View {
    
    var imageName: String
    var productName: String
    var productPrice: Double
    var productStock: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.mint)
                .cornerRadius(15)
                .shadow(radius: 5)
            
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(productName)
                    .font(.headline)
                HStack {
                    Text(String(productPrice))
                    
                    Text("Qty:")
                    Text(String(productStock))
                }
                .font(.subheadline)
            }
            .padding()
        }
        .padding(.horizontal)
        .frame(width: 200, height: 165.0)
    }
}
