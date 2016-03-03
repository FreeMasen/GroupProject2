//
//  Item.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Item {
    var Id: Int
    var Name: String
    var Price: Double
    var Desc: String
    var TimeAddedToOrder: NSDate?
    var Menues: UInt8
    var Type: ItemType
    
    init(id: Int, name: String, price: Double, desc: String, menues: UInt8, type: ItemType) {
        Id = id
        Name = name
        Price = price
        Desc = desc
        Menues = menues
        Type = type
    }
}

enum MenuType: UInt8 {
    case Nothing =      0b0000
    case Breakfast =    0b1000
    case Lunch =        0b0100
    case HappyHour =    0b0010
    case Dinner =       0b0001
}

enum ItemType: Int {
    case Nothing =      0
    case Apps =         1
    case Entre =        2
    case Dessert =      4
    case Drinks =       8
}