//
//  FloorViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class FloorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {

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
        let longPress = UILongPressGestureRecognizer(target: self, action: "longPress:")
        longPress.minimumPressDuration = 0.5
        longPress.delegate = self
        longPress.delaysTouchesBegan = true
        self.floorCollectionView.addGestureRecognizer(longPress)
    }
    
    func longPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if (gestureRecognizer.state != UIGestureRecognizerState.Ended){
            return
        }
        
        let p = gestureRecognizer.locationInView(self.floorCollectionView)
        
        if let indexPath : NSIndexPath = (self.floorCollectionView?.indexPathForItemAtPoint(p))!{
            let tableID = floor.Tables[indexPath.row].Id
            floor.removeTable(tableID)
            self.floorCollectionView.reloadData()
        }

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
    
    
    
}