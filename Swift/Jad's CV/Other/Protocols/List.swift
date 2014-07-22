//
//  List.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol List {
    typealias DataType
    
    /// The data for the list view. The format will always include multiple
    /// sections.
    //FIXME: Multidimensional array is not friends with Xcode
    var data: ([DataType])! { get set }
    
    func isValidIndexPath(indexPath: NSIndexPath) -> Bool
    
    /**
    *  Returns the object from the data source associated with the given
    *  index path.
    *
    *  @param indexPath The index path of the object in the data source.
    *
    *  @return The object at the given index path.
    */
    func objectAtIndexPath(indexPath: NSIndexPath) -> DataType!
    
    /**
    *  Helper method to configure a cell at the given index path with a given
    *  object.
    *
    *  @param listView The list view who's cell is configured.
    *  @param cell      The cell to configure.
    *  @param object    The object which matches the cell's index path.
    *  @param indexPath The index path of the cell to configure.
    */
    func listView(listView: UIView, configureCell cell: UIView, withObject object: DataType?, atIndexPath indexPath: NSIndexPath)
    
    /**
    *  Called when the user selects a cell a the given index path.
    *
    *  @param listView The list view who is interacted with.
    *  @param object    The object at the selected index path.
    *  @param indexPath The index path of the cell which was selected.
    */
    func listView(listView: UIView, didSelectObject object: DataType, atIndexPath indexPath: NSIndexPath)
    
    /**
    *  The cell identifier for the given index path.
    *
    *  @param indexPath The index path of the cell.
    *
    *  @return The cell identifier.
    */
    func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String
}