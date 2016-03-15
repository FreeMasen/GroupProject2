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
    var tableList = [Int]()
    @IBOutlet weak var addTableButton: UIButton!
    let userDefaultsNumberOfTablesKey = "defaultNumberOfTables"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 1...initialTableCount() {
            addTableToCollection("Sender")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.floorCollectionView.dequeueReusableCellWithReuseIdentifier("collection", forIndexPath: indexPath) as! TableCollectionItem
            cell.tableLabel.text = "Table \(tableList[indexPath.row])"
        
        
        return cell
    }
    
    
    @IBAction func addTableToCollection(sender: AnyObject) {
        
        tableList.append(tableList.count + 1)
        floorCollectionView.reloadData()
        saveTableCount(tableList.count)
        
        
        
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