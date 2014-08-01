//
//  DynamicTypeTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class DynamicTypeTableViewController: TableViewController {
    
    private var cellHeights = [Int: CGFloat]()
    
    //MARK: Table view
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let height = cellHeights[indexPath.row]
        
        return height ? height! : 44.0
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        
        if let dynamicCell = cell as? DynamicTypeTableViewCell {
            dynamicCell.layoutSubviews()
            cellHeights[indexPath.row] = dynamicCell.optimalCellheight()
        }
        
        return cell
    }
}
