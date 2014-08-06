//
//  List.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//FIXME: bring this back into ListData... when SourceKit stops having a fit.
struct ListSection<T>: Section {
    var rowObjects: [T]
    var name: String?
}

struct ListData<T> {

    var sections: [ListSection<T>]
    
    init() {
        self.sections = [ListSection<T>]()
    }
    
    subscript (index: Int) -> ListSection<T> {
        return sections[index]
    }
    subscript (indexPath: NSIndexPath) -> T? {
        return sections[indexPath.section].rowObjects[indexPath.row]
    }
    
    func isValidIndexPath(indexPath: NSIndexPath) -> Bool {
        if indexPath.section < 0 || indexPath.section >= sections.count {
            return false
        }
        if indexPath.row < 0 || indexPath.row >= sections.count {
            return false
        }
        
        return true
    }
}

protocol Section {
    typealias RowObject
    
    var rowObjects: [RowObject] { get set }
    var name: String? { get set }
}

protocol List {
    typealias Data
    typealias Object
    
    /// The data for the list view. The format will always include multiple
    /// sections.
    var listData: Data { get set }
    
    /**
     *  Helper method to configure a cell at the given index path with a given
     *  object.
     *
     *  :param: listView  The list view who's cell is configured.
     *  :param: cell      The cell to configure.
     *  :param: object    The object which matches the cell's index path.
     *  :param: indexPath The index path of the cell to configure.
     */
    func listView(listView: UIView, configureCell cell: UIView, withObject object: Object, atIndexPath indexPath: NSIndexPath)
    
    /**
     *  Called when the user selects a cell a the given index path.
     *
     *  :param: listView The list view who is interacted with.
     *  :param: object    The object at the selected index path.
     *  :param: indexPath The index path of the cell which was selected.
     */
    func listView(listView: UIView, didSelectObject object: Object, atIndexPath indexPath: NSIndexPath)
    
    /**
     *  The cell identifier for the given index path.
     *
     *  :param: indexPath The index path of the cell.
     *
     *  :returns: The cell identifier.
     */
    func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String
}