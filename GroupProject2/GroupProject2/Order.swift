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
    var Total: Double {
        return Items.reduce(0, combine: {$0 + $1.Price})
    }
    
    init(orderId: Int, items: [Item]) {
        OrderId = orderId
        Items = items
    }

    func addItem(item: Item) {
        Items.append(item)
    }
    
    func removeItemWithId(id: Int) {
        
    }
}