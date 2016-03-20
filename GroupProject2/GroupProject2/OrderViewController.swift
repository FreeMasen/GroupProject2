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
            performSegueWithIdentifier("checkout", sender: nil)
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
            newView.table = self.table
            let id = (table?.Orders.count)!+1
            newView.order = Order(orderId: id, items: [Item]())
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
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
