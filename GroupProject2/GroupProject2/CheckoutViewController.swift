//
//  CheckoutViewController.swift
//  GroupProject2
//
//  Created by Robert Masen on 3/20/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    
    var order = -1
    var table: Table!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        subtotal.text = String(format: "$%.2f", table.Orders[order].SubTotal)
        tax.text = String(format: "$%.2f", table.Orders[order].Tax)
        total.text = String(format: "$%.2f", table.Orders[order].Total)
        tableview.reloadData()
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let o = table?.Orders[order] {
            let cell = UITableViewCell(style: .Value2, reuseIdentifier: "cell")
            let price = String(format: "$%.2f", o.Items[indexPath.row].Price)
            let name = o.Items[indexPath.row].Name
            cell.detailTextLabel?.text = price
            cell.textLabel?.text = name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if order != -1 {
            return table.Orders[order].Items.count
        }
        return 0
    }
    
    @IBAction func checkout(sender: AnyObject) {
        if order > -1 {
            table?.DeleteOrderWithId((table?.Orders[order].OrderId)!)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
