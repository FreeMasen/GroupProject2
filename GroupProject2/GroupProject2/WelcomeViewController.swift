//
//  WelcomeViewController.swift
//  GroupProject2
//
//  Created by Casey on 2/26/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var two: UILabel!
    
    var loaded: Bool? {
        didSet {
            if loaded != nil {
                UIView.animateWithDuration(1.0, delay: 1.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .BeginFromCurrentState, animations: { _ in
                    
                    }, completion: { _ in
                    UIView.animateWithDuration(1.0, delay: 1.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .AllowAnimatedContent, animations: { _ in
                            
                            self.two.center = CGPoint(x: self.cenX!, y: self.cenY!)
                            
                            }, completion: { _ in
                                self.two.textColor = UIColor.redColor()
                    })
                })

            }
        }
    }
    var cenY: CGFloat?
    var cenX: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0..<(initialTableCount()) {
            floor.Tables.append(Table())
        }
        menu = SQLhelper.GetMenu()
        two = UILabel()
        two.text = "2"
        two.font = UIFont.systemFontOfSize(200)
        two.sizeToFit()
        cenY = view.center.y
        cenX = view.center.x
        two.center = CGPoint(x: 1000 , y: cenY!)
        two.textColor = UIColor.whiteColor()
        view.addSubview(two)
        loaded = true
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



}
