//
//  SQLHelper.swift
//  GroupProject2
//
//  Created by Robert Masen on 3/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import SQLite

class SQLhelper {
    
    private static let documentDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    private static let connectionString = "\(documentDir)/GroupProject2.db"
    private static let MenuTable = SQLite.Table("MenuTable")
    private static let Id = Expression<Int>("ID")
    private static let Name = Expression<String>("Name")
    private static let Price = Expression<Double>("Price")
    private static let Desc = Expression<String>("Desc")
    private static let Menues = Expression<Int>("Menues")
    private static let Type = Expression<Int>("Type")
    
    static func GetItems() -> [Item] {
        var items = [Item]()
        do {
            clearSeedData()
            let db = try Connection(connectionString)
            ensureTableExisits(db)
            fillSeedData(db)
            do {
                for row in try db.prepare(MenuTable) {
                    let id = row[Id]
                    let name = row[Name]
                    let price = row[Price]
                    let desc = row[Desc]
                    let menues = UInt8(row[Menues])
                    let type = ItemType(rawValue: row[Type])
                    let item = Item(id: id, name: name, price: price, desc: desc, menues: menues, type: type!)
                    items.append(item)
                    
                }
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return items
    }
    
    static func insertItem(item: Item) {
        do {
            let db = try Connection(connectionString)
            do {
                try db.run( MenuTable.insert(Name <- item.Name, Price <- item.Price, Desc <- item.Desc, Menues <- Int(item.Menues), Type <- item.Type.rawValue))
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    static func removeItem(item: Item) {
        do {
            let db = try Connection(connectionString)
            do {
                let rowToDelete = MenuTable.filter(Id == item.Id)
                try db.run( rowToDelete.delete())
            } catch {
                print(error)
            }
        } catch {
                print(error)
        }
    }
    
    private static func clearSeedData() {
        let fm = NSFileManager.defaultManager()
        do {
            try fm.removeItemAtPath(connectionString)
        } catch {
            print(error)
        }
    }
    
    private static func fillSeedData(db: Connection) {
        do {
            try db.run( MenuTable.insert(Name <- "Bread", Price <- 1.99, Desc <- "Sliced bagette and butter", Menues <- 15, Type <- 1) )
        } catch {
            print(error)
        }
        do {
            try db.run( MenuTable.insert(Name <- "Hamburger", Price <- 8.99, Desc <- "1/3 lb beef patty, sesame seed bun, lettuce, tomato and mayo.", Menues <- 12, Type <- 2) )
        } catch {
            print(error)
        }
        do {
            try db.run( MenuTable.insert(Name <- "Walleye", Price <- 21.99, Desc <- "Sauted in butter sauce", Menues <- 8, Type <- 2) )
        } catch {
            print(error)
        }
        do {
            try db.run( MenuTable.insert(Name <- "Fries", Price <- 3.99, Desc <- "Double fried potato fries", Menues <- 14, Type <- 2) )
        } catch {
            print(error)
        }
        do {
            try db.run( MenuTable.insert(Name <- "MaiThai", Price <- 6.99, Desc <- "delicious", Menues <- 15, Type <- 8) )
        } catch {
            print(error)
        }
        do {
            try db.run( MenuTable.insert(Name <- "Beer", Price <- 3.99, Desc <- "Malty", Menues <- 15, Type <- 8) )
        } catch {
            print(error)
        }

    }
    
    private static func ensureTableExisits(db: Connection) {
        do {
        try db.run(MenuTable.create { t in
            t.column(Id, primaryKey: true)
            t.column(Name)
            t.column(Price)
            t.column(Desc)
            t.column(Menues)
            t.column(Type)
            })
        } catch {
            print(error)
        }
    }
}