//
//  WelcomeViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var project: UILabel!
    @IBOutlet weak var group: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0..<(initialTableCount()) {
            floor.Tables.append(Table())
        }
        menu = SQLhelper.GetMenu()
        UIView.animateWithDuration(3.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { n in
                self.two.center  = CGPoint(x: 315, y: 215)
            }, completion: { n in
            
        })
    }
    
    
    
    deinit {
        saveTableCount(floor.Tables.count)
    }
    
    func initialTableCount() -> Int {
        let savedCount = NSUserDefaults.standardUserDefaults().objectForKey("defaultNumberOfTables") as? Int
        if let count = savedCount  {
            return count
        } else {
            return 0
        }
    }
    
    func saveTableCount(count: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(count, forKey: "defaultNumberOfTables")
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
