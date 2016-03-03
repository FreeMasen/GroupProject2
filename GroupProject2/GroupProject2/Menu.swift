//
//  Menu.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Menu {
    var currentMenuWindow: UInt8 = MenuType.Dinner.rawValue
    var Apps = [Item]()
    var Entre = [Item]()
    var Dessert = [Item]()
    var Drinks = [Item]()
    
    init() {
        
    }
    
    func GetItemsForMenu() {
        for item in SQLhelper.GetItems() {
            if item.Menues & currentMenuWindow == currentMenuWindow {
                switch item.Type {
                case .Apps:
                    Apps.append(item)
                    break
                case .Entre:
                    Entre.append(item)
                    break
                case .Dessert:
                    Dessert.append(item)
                    break
                case .Drinks:
                    Drinks.append(item)
                    break
                default:
                    break
                }
            }
        }
    }
}

