//
//  ExperienceSplitViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 1/08/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

protocol MasterSplitViewControllerDelegate {
    func masterViewController(masterViewController: UIViewController, didSelectDetailObject detailObject: ExperienceObject)
}

//FIXME: When Generics can be used for Obj-C subclasses fix this.
//class ExperienceMasterTableViewController<T: ExperienceObject>: DynamicTypeTableViewController {
class ExperienceMasterTableViewController: DynamicTypeTableViewController {
    var delegate: MasterSplitViewControllerDelegate?
    
    override func listView(listView: UIView, didSelectObject object: Any, atIndexPath indexPath: NSIndexPath) {
        delegate?.masterViewController(self, didSelectDetailObject: object as ExperienceObject)
    }
}

//FIXME: When Generics can be used for Obj-C subclasses fix this.
//class ExperienceSplitViewController<Master: UIViewController where Master: MasterSplitViewControllerDelegate>: UIViewController {
class ExperienceSplitViewController: UIViewController {

    var masterViewController: UIViewController!
    var detailViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
