//
//  EditMenuItemsViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/29/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class EditMenuItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var editMenuTableView: UITableView!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var descTextField: UITextField!
    
    var items = ["test1","test2"]
    var descriptions = ["tester","tester2"]
    var prices = [2.25, 3.25]
    var photos = [UIImage()]
//    var itemObject = [Item()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //**USER INPUT**
    @IBAction func getItem(sender: UITextField) {
        
    }
    
    @IBAction func getPrice(sender: UITextField) {
        
    }
    
    @IBAction func getDesc(sender: UITextField) {
        
    }
    
    @IBAction func addNewMenuItem(sender: UIButton) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.editMenuTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EditMenuItemCell
      
        cell.itemLabel.text = items[indexPath.row]
        cell.descLabel.text = descriptions[indexPath.row]
        cell.priceLabel.text = "\(prices[indexPath.row])"
        return cell
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
