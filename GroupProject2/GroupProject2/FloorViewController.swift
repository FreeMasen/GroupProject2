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
    var selectedTable = 0 {
        didSet {
            performSegueWithIdentifier("order", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedTable = indexPath.row

    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return floor.Tables.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.floorCollectionView.dequeueReusableCellWithReuseIdentifier("collection", forIndexPath: indexPath) as! TableCollectionItem
            cell.tableLabel.text = "Table \(floor.Tables[indexPath.row].Id)"
            cell.userInteractionEnabled = true
        return cell
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let navView = segue.destinationViewController as? UINavigationController {
            let newView = navView.viewControllers[0] as? OrderViewController
            newView!.table = floor.Tables[selectedTable]
        }
    }
    
    @IBAction func addTableToCollection(sender: AnyObject) {
        floor.Tables.append(Table())
        floorCollectionView.reloadData()
    }
    

    
    // Returns the number of tables that were saved in the user defaults.

    
    // Saves the number of tables in the user defaults.
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}