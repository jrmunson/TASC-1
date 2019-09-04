//
//  CartItem.swift
//  TASC-1
//
//  Created by Jim Munson on 8/31/19.
//  Copyright © 2019 Jim Munson. All rights reserved.
//
import Foundation

class CartItem {
    
    var quantity : Int = 1
    var product : Product
    
 //   var subTotal : Float { get { return product.price * Float(quantity) } }
    
    init(product: Product) {
        self.product = product
    }
}
