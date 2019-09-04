//
//  CartItemTableViewCell.swift
//  TASC-1
//
//  Created by Jim Munson on 8/31/19.
//  Copyright © 2019 Jim Munson. All rights reserved.
//

import UIKit

protocol CartItemDelegate {
    func updateCartItem(cell: CartItemTableViewCell, quantity: Int)
}

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var salesTax: UILabel!
    
    var delegate: CartItemDelegate?
    var quantity: Int = 1

    let products:[Product] = ProductsListHelper().all()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
