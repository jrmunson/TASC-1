//
//  CartViewController.swift
//  TASC-1
//
//  Created by Jim Munson on 8/31/19.
//  Copyright © 2019 Jim Munson. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    // initial variables
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    
    var cart: Cart? = nil
    var receipt1 = [0,1,2]
    var receipt2 = [4,9]
    var receipt3 = [5,6,10,8]
    var displayArray = [1]
    var receiptTotalPrice:Float = 0
    var receiptTotalSalesTax:Float = 0
    var salesTax:Float = 0
    var dutyTax:Float = 0
    var cellLineItemTax:Float = 0
    var cellLineItemPrice:Float = 0
 
    let reuseIdentifier = "CartItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        displayArray = receipt1
        
        // create receipt buttons
        
        let rec1Btn = UIButton(frame: CGRect(x: 50, y: 500, width: 90, height: 50))
        rec1Btn.tag = 1
        rec1Btn.tintColor = UIColor.blue
        rec1Btn.backgroundColor = .blue
        rec1Btn.setTitle("Receipt 1", for: .normal)
        rec1Btn.layer.cornerRadius = 5
        rec1Btn.layer.borderWidth = 1
        rec1Btn.addTarget(self, action: #selector(changeReceipt), for: .touchUpInside)
        
        self.view.addSubview(rec1Btn)
        
        let rec2Btn = UIButton(frame: CGRect(x: 150, y: 500, width: 90, height: 50))
        rec2Btn.tag = 2
        rec2Btn.backgroundColor = .blue
        rec2Btn.setTitle("Receipt 2", for: .normal)
        rec2Btn.layer.cornerRadius = 5
        rec2Btn.layer.borderWidth = 1
        rec2Btn.addTarget(self, action: #selector(changeReceipt), for: .touchUpInside)
        
        self.view.addSubview(rec2Btn)
        
        let rec3Btn = UIButton(frame: CGRect(x: 250, y: 500, width: 90, height: 50))
        rec3Btn.tag = 3
        rec3Btn.backgroundColor = .blue
        rec3Btn.setTitle("Receipt 3", for: .normal)
        rec3Btn.layer.cornerRadius = 5
        rec3Btn.layer.borderWidth = 1
        rec3Btn.addTarget(self, action: #selector(changeReceipt), for: .touchUpInside)
        
        self.view.addSubview(rec3Btn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // dies
        super.viewWillAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func changeReceipt(sender: UIButton!) {
   
        // use correct sales array for button press
        // by using the display array as the data source, I do not have to derive which
        // receipt I am printing in the tableView methods.
        
        switch (sender.tag){
        case 1:
            displayArray = receipt1
        case 2:
            displayArray = receipt2
        case 3:
            displayArray = receipt3

        default:
           print("array error")
        }
        
       // reset receipts total
        receiptTotalSalesTax = 0
        receiptTotalPrice = 0
        tableView?.reloadData()
        
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return displayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CartItemTableViewCell
        
            cell.priceLabel.text = ""
            salesTax = 0
        
            cell.delegate = self as? CartItemDelegate
            cell.nameLabel.text = cell.products[displayArray[indexPath.row]].name
        
        
            cell.quantityLabel.text = "1"
        
        
            // tax and duty calculations should be ithe 
            // sales tax
        
            if ((cell.products[displayArray[indexPath.row]].tax) > 0) {
                salesTax += (cell.products[displayArray[indexPath.row]].tax) * (cell.products[displayArray[indexPath.row]].price)

            }
        
            // duty
        
            if ((cell.products[displayArray[indexPath.row]].duty) > 0) {
                dutyTax += (cell.products[displayArray[indexPath.row]].duty) * (cell.products[displayArray[indexPath.row]].price)
                cellLineItemPrice += dutyTax
                cellLineItemTax += dutyTax
 //               print(cellLineItemTax)
 //               print(dutyTax)
            }
        
            cellLineItemTax  = dutyTax + salesTax
        
            cellLineItemPrice = cell.products[displayArray[indexPath.row]].price + cellLineItemTax
        
            let formatted = String(format: "%.2f", cellLineItemPrice)
            cell.priceLabel.text = formatted
        
//            print(cell.products[displayArray[indexPath.row]].name)
//            print(salesTax)
//            print(dutyTax)
//            print(cellLineItemTax)
        
            // calc receipt totals
            receiptTotalPrice +=  cell.products[displayArray[indexPath.row]].price + cellLineItemTax
            receiptTotalSalesTax += cellLineItemTax
       
        
            // add  tax/duty to line item
       
            cell.salesTax.text = String(format: "%.2f",cellLineItemTax)
//            print(cell.salesTax.text)
        
            totalLabel.text = String(format: "%.2f",receiptTotalPrice) // golden
            taxLabel.text = String(format: "%.2f", receiptTotalSalesTax)
        
            // reset cell variables
            cellLineItemTax = 0
            salesTax = 0
            dutyTax = 0
      
          
            return cell
        }
}


