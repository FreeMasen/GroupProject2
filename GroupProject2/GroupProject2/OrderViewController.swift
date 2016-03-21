//
//  OrderViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var tableTextField: UITextField!
    @IBOutlet weak var partySizeTextField: UITextField!
    @IBOutlet weak var newOrderButton: UIButton!
    @IBOutlet weak var serverTextField: UITextField!
    
    var table: Table?
    var selectedOrder: Int = -1 {
        didSet {
            if orderTableView.editing == false {
                performSegueWithIdentifier("checkout", sender: "new")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if table != nil {
            tableTextField.text = "\(table!.Id)"
            partySizeTextField.text = "\(table!.Orders.count)"
            serverTextField.text = "\(table!.Server)"
        }
        let back = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("back"))
        self.navigationItem.rightBarButtonItem = back
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        partySizeTextField.text = "\(table!.Orders.count)"
        orderTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.dismissViewControllerAnimated(true) { n in
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = table?.Orders.count {
            return count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")

        if let orders = table?.Orders {
            cell.textLabel?.text = "\(orders[indexPath.row].OrderId): \(orders[indexPath.row].Items.count) items"
            cell.detailTextLabel?.text = String(format: "Total: $%.2f", orders[indexPath.row].Total)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedOrder = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newView = segue.destinationViewController as? NewOrderViewController {
            if sender != nil {
                newView.table = self.table
                newView.order = Order(items: [Item]())
            } else {
                newView.table = self.table
                newView.order = table?.Orders[selectedOrder]
                newView.newOrder = false
            }
        } else if let newView = segue.destinationViewController as? CheckoutViewController {
            newView.table = self.table
            newView.order = selectedOrder
        }
    }
    
    @IBAction func getTable(sender: UITextField) {
        
    }
    
    @IBAction func getPartySize(sender: UITextField) {
        
    }
    
    @IBAction func getServer(sender: UITextField) {
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            table!.DeleteOrderWithId(indexPath.row)
        }
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .Normal, title: "edit", handler: { action in
            self.selectedOrder = indexPath.row
            self.performSegueWithIdentifier("newOrder", sender: nil)
            self.orderTableView.reloadData()
        })
        edit.backgroundColor = UIColor.greenColor()
        let delete = UITableViewRowAction(style: .Normal, title: "delete", handler: { action in
            self.selectedOrder = indexPath.row
            self.table!.DeleteOrderWithId((self.table?.Orders[indexPath.row].OrderId)!)
            self.orderTableView.reloadData()
            })
        delete.backgroundColor = UIColor.redColor()
        return [edit, delete]
    }
    
}
