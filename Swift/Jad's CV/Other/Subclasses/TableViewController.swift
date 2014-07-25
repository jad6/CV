//
//  TableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//TODO: Make class Generic once Apple fixes the bug in Beta 4
class TableViewController : UITableViewController, List {
    
    //TODO: re-enable that once Swift supports class variables
//    private class let defaultCellIdentifier = "Cell"
    
    private class func defaultCellIdentifier() -> String {
        return "Cell"
    }
    
    var listData: ListData<ExtraCurricularActivity> = ListData<ExtraCurricularActivity>() {
    didSet {
        tableView.reloadData()
    }
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nil, bundle: nil)
    }

    init(style: UITableViewStyle, listData: ListData<ExtraCurricularActivity>) {
        super.init(style: style)
        
        self.listData = listData
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: TableViewController.defaultCellIdentifier())
    }

    //MARK: List

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
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return listData.sections.count
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return listData[section].rowObjects.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // Get identifiers from overrriden method.
        let identifier = cellIdentifierForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        
        // Get object from overriden method.
        let object = listData[indexPath]
        // Let the subclasses configure the cell.
        listView(tableView, configureCell: cell, withObject: object, atIndexPath: indexPath)
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        // Get object from overriden method.
        let object = listData[indexPath]
        // Call overridable method.
        listView(tableView, didSelectObject: object, atIndexPath: indexPath)
    }
}
