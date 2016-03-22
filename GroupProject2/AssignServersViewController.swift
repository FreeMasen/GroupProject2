//
//  AssignServersViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/29/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class AssignServersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var serverName: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCells = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("tableItem", forIndexPath: indexPath) as? TableCollectionItem{
            let id = floor.Tables[indexPath.row]
            cell.tableLabel.text = "Table \(id)"
            cell.backgroundColor = UIColor.brownColor()
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            if cell.highlighted {
                cell.highlighted = false
                cell.backgroundColor = UIColor.brownColor()
                removeSelection(indexPath.row)
            } else {
                cell.highlighted = true
                addSelectionToArray(indexPath.row)
                cell.backgroundColor = UIColor.greenColor()
            }
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return floor.Tables.count
    }
    @IBAction func addButtonClick(sender: AnyObject) {
        addServerToTable()
    }
    
    func addSelectionToArray(selection: Int) {
        selectedCells.append(selection)
    }
    
    func removeSelection(selection: Int) {
        var itter = 0
        var index: Int?
        for i in selectedCells {
            if i == selection {
                index = itter
            }
            itter += 1
        }
        if index != nil {
            selectedCells.removeAtIndex(index!)
        }
    }
    
    func addServerToTable() {
        if serverName.text != "" {
            for t in selectedCells {
                floor.Tables[t].Server = serverName.text!
            }
            serverName.text = ""
            selectedCells = [Int]()
            collectionView.reloadData()
        }
    }
}