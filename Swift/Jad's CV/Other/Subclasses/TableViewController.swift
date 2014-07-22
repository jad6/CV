//
//  TableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, List {
    
    typealias DataType = Any
    
    //TODO: re-enable that once Swift supports class variables
//    private class let defaultCellIdentifier = "Cell"
    
    private class func defaultCellIdentifier() -> String {
        return "Cell"
    }
    
    var data: ([Any])! {
    didSet {
        tableView.reloadData()
    }
    }
    
    init(style: UITableViewStyle, data: ([Any])!) {
        self.data = data
        super.init(style: style)
                
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: TableViewController.defaultCellIdentifier())
    }

    //MARK: List
    
    func isValidIndexPath(indexPath: NSIndexPath) -> Bool {
        if indexPath.section < 0 || indexPath.section >= numberOfSectionsInTableView(tableView) {
            return false
        }
        if indexPath.row < 0 || indexPath.row >= tableView(tableView, numberOfRowsInSection: indexPath.section) {
            return false
        }
        
        return true
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> Any! {
        if !isValidIndexPath(indexPath) {
            return nil
        }

        //FIXME: Multidimensional array is not friends with Xcode
//        return data[indexPath.section][indexPath.row]
        return data[indexPath.row]
    }

    func listView(listView: UIView, configureCell cell: UIView, withObject object: Any?, atIndexPath indexPath: NSIndexPath) {
        // Override me!
    }
    
    func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        // Override me!
    }

    func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String {
        return TableViewController.defaultCellIdentifier()
    }
    
    //MARK: Table view 
    
    //FIXME: Multidimensional array is not friends with Xcode
//    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
//        return data.count
//    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        //FIXME: Multidimensional array is not friends with Xcode
//        return data[section].count
        return data.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // Get identifiers from overrriden method.
        let identifier = cellIdentifierForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        
        // Get object from overriden method.
        let object = objectAtIndexPath(indexPath)
        // Let the subclasses configure the cell.
        listView(tableView, configureCell: cell, withObject: object, atIndexPath: indexPath)
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        // Get object from overriden method.
        let object = objectAtIndexPath(indexPath)
        // Call overridable method.
        listView(tableView, didSelectObject: object, atIndexPath: indexPath)
    }
}
