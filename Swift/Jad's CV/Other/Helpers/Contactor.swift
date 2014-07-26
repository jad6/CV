//
//  Contactor.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 19/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit
import MessageUI

class Contactor: NSObject, MFMailComposeViewControllerDelegate {
    
    var viewController: UIViewController?
    
    class var sharedContactor: Contactor {
    struct Static {
        static let instance = Contactor()
    }
    return Static.instance
    }
    
    class func call(#number: String) {
        if UIDevice.canCall() {
            let telPhone = "tel://" + number.stringByReplacingOccurrencesOfString(" ", withString: "")
            let phoneURL = NSURL(string: telPhone)
            
            let application = UIApplication.sharedApplication()
            if application.canOpenURL(phoneURL) {
                application.openURL(phoneURL)
            }
        }
    }
    
    func email(#reciepients: [String]?, fromController controller: UIViewController) {
        if UIDevice.canEmail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(reciepients)
            controller.presentViewController(mailComposer, animated: true, completion: nil)
            
            viewController = controller
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        error?.handle()
        
        viewController!.dismissViewControllerAnimated(true) {
            self.viewController = nil
        }
    }
}