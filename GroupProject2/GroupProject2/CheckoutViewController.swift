//
//  CheckoutViewController.swift
//  GroupProject2
//
//  Created by Robert Masen on 3/20/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var subtotal: UILabel!
    
    var order = -1
    var table: Table?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
        if order > -1 {
            subtotal.text = String(format: "$%.2f", table!.Orders[order].SubTotal)
            tax.text = String(format: "$%.2f", table!.Orders[order].Tax)
            total.text = String(format: "$%.2f", table!.Orders[order].Total)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return table!.Orders[order].Items.count
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
        return 1
    }
    @IBAction func checkout(sender: AnyObject) {
        if order > -1 {
            floor.removeTable(order)
        }
    }
    
}
