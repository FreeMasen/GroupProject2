//
//  Order.swift
//  GroupProject2
//
//  Created by Robert Masen on 2/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class Order {
    var OrderId : Int
    var Items: [Item]
    var SubTotal: Double {
        return Items.reduce(0, combine: {$0 + $1.Price})
    }
    var Tax: Double {
        return (SubTotal * 0.175)
    }
    var Total: Double {
        return (SubTotal + Tax)
    }
    
    init(orderId: Int, items: [Item]) {
        OrderId = orderId
        Items = items
    }

    func addItem(item: Item) {
        Items.append(item)
    }
    
    func removeItemWithId(id: Int) {
        var itter = 0
        var index = -1
        for item in Items {
            if item.Id == id {
                index = itter
            }
            itter += 1
        }
        if itter > -1 {
            Items.removeAtIndex(index)
        }
    }
}