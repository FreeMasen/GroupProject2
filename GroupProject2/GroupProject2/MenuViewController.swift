//
//  MenuViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.GetItemsForMenu()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Apps"
        case 1:
            return "Entres"
        case 2:
            return "Desserts"
        case 3:
            return "Drinks"
        default:
            return nil
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu.Apps.count
        case 1:
            return menu.Entre.count
        case 2:
            return menu.Dessert.count
        case 3:
            return menu.Drinks.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.menuTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MenuItemCell
        switch indexPath.section {
            case 0:
                cell.item.text = menu.Apps[indexPath.row].Name
                cell.desc.text = menu.Apps[indexPath.row].Desc
                cell.price.text = String(format:"$%.2f", menu.Apps[indexPath.row].Price)
                break
            case 1:
            cell.item.text = menu.Entre[indexPath.row].Name
            cell.desc.text = menu.Entre[indexPath.row].Desc
            cell.price.text = String(format:"$%.2f", menu.Entre[indexPath.row].Price)
            break
            case 2:
            cell.item.text = menu.Dessert[indexPath.row].Name
            cell.desc.text = menu.Dessert[indexPath.row].Desc
            cell.price.text = String(format:"$%.2f", menu.Dessert[indexPath.row].Price)
            break
            case 3:
            cell.item.text = menu.Drinks[indexPath.row].Name
            cell.desc.text = menu.Drinks[indexPath.row].Desc
            cell.price.text = String(format:"$%.2f", menu.Drinks[indexPath.row].Price)
            break
        default: break
        }

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
