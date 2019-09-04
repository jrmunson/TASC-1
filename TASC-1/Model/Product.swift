//
//  Product.swift
//  TASC-1
//
//  Created by Jim Munson on 8/31/19.
//  Copyright © 2019 Jim Munson. All rights reserved.
//

import Foundation

struct Product: Codable, Equatable {
    
    var name: String
    var price: Float
    var tax: Float
    var duty: Float
    
}

