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
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    var items = []
    var descriptions = []
    var prices = []
    var photos = [UIImage()]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.orderTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuItemCell
        
        cell.item.text = (items[indexPath.row] as! String)
        cell.desc.text = (descriptions[indexPath.row] as! String)
        cell.price.text = (prices[indexPath.row] as! String)
        return cell
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
