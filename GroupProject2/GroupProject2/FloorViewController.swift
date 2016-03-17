//
//  FloorViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class FloorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var floorCollectionView: UICollectionView!
    
    @IBOutlet weak var addTableButton: UIButton!
    let userDefaultsNumberOfTablesKey = "defaultNumberOfTables"
    var selectedTable = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0..<(initialTableCount()) {
            addTableToCollection("Sender")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return floor.Tables.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.floorCollectionView.dequeueReusableCellWithReuseIdentifier("collection", forIndexPath: indexPath) as! TableCollectionItem
            cell.tableLabel.text = "Table \(floor.Tables[indexPath.row].Id)"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        selectedTable = indexPath.row
        performSegueWithIdentifier("order", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newView = segue.destinationViewController as? OrderViewController {
            newView.table = floor.Tables[selectedTable]
        }
    }
    
    @IBAction func addTableToCollection(sender: AnyObject) {
        floor.Tables.append(Table())
        floorCollectionView.reloadData()
        saveTableCount(floor.Tables.count)
    }
    
    // Returns the number of tables that were saved in the user defaults.
    func initialTableCount() -> Int {
        let savedCount = NSUserDefaults.standardUserDefaults().objectForKey(userDefaultsNumberOfTablesKey) as? Int
        if let count = savedCount  {
            return count
        } else {
            return 0
        }
    }
    
    // Saves the number of tables in the user defaults.
    func saveTableCount(count: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(count, forKey: userDefaultsNumberOfTablesKey)
        defaults.synchronize()
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