//
//  DynamicTypeTableViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 29/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

class DynamicTypeTableViewController: TableViewController {
    
    var cellHeights = [Int: CGFloat]()
    
    //MARK: Table view
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        let height = cellHeights[indexPath.row]
        return (height) ? height! : 44.0
    }
    
    //MARK: Dynamic type
    
    func dynamicTableViewCell(cell: DynamicTypeTableViewCell, didChangeOptimalHeight: CGFloat) {
        if let indexPath = tableView.indexPathForCell(cell) {
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
}
