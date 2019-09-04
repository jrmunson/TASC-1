//
//  ProductsManager.swift
//  TASC-1
//
//  Created by Jim Munson on 8/31/19.
//  Copyright © 2019 Jim Munson. All rights reserved.
//

import Foundation

class ProductsListHelper {

    private let productsJson = """
        [
            {
                "name": "16lb bag of Skittles",
                "price": 16.00,
                "tax": 0,
                "duty": 0
            },
            {
                "name": "Walkman",
                "price": 99.99,
                "tax": 0.10,
                "duty": 0
            },
            {
                "name": "Bag microwave popcorn",
                "price": 0.99,
                "tax": 0,
                "duty": 0.00
            },
            {
                "name": "Imported Vespa",
                "price": 15001.25,
                "tax": 0.10,
                "duty": 0.05
            },
            {
                "name": "Imported bag of Vanilla-Hazelnut Coffee",
                "price": 11.00,
                "tax": 0,
                "duty": 0.05
            },
            {
                "name": "Imported crate of Almond Snickers",
                "price": 75.99,
                "tax": 0,
                "duty": 0.05
            },
            {
                "name": "Discman",
                "price": 55,
                "tax": 0.10,
                "duty": 0
            },
            {
                "name": "Imported Bottle of Wine",
                "price": 10.00,
                "tax": 0.10,
                "duty": 0.05
            },
            {
                "name": "300# bag of Fair-Trade Coffee",
                "price": 997.99,
                "tax": 0,
                "duty": 0
            },
            {
                "name": "Imported Vespa",
                "price": 15001.25,
                "tax": 0.10,
                "duty": 0.05
            },
            {
                "name": "Imported Bottle of Wine",
                "price": 10.00,
                "tax": 0.10,
                "duty": 0.05
            },
        ]
        """.data(using: .utf8)!
    
    func all() -> [Product] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Product].self, from: productsJson)
        
        return products
    }
}

