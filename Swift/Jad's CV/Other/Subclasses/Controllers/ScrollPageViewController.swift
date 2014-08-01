//
//  ScrollPageViewController.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 21/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import UIKit

//protocol PageContent {
//    var pageNumber: UInt { get set }
//    var object: Any? { get set }
//    
//    func didUpdateContentObject()
//}
//
//class ScrollPageViewController<T: UIViewController where T: PageContent>: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
//    
//    let numberOfPages: UInt
//    var initialIndex: UInt
//    var currentContentViewController: T!
//    
//    var currentContentObject: Any? {
//    get {
//        return self.currentContentViewController?.object
//    }
//    }
//    var currentIndex: UInt {
//    get {
//        if let currentController = self.currentContentViewController {
//            return currentController.pageNumber
//        } else {
//            return 0
//        }
//    }
//    }
//    var swipeLock: Bool {
//    didSet {
//        for subview in self.view.subviews {
//            if let scrollView = subview as? UIScrollView {
//                scrollView.scrollEnabled = (self.swipeLock == false)
//            }
//        }
//    }
//    }
//    
//    init(numberOfPages: UInt, initialIndex: UInt, navigationOrientation orientation: UIPageViewControllerNavigationOrientation) {
//        self.numberOfPages = numberOfPages
//        self.initialIndex = initialIndex
//        self.swipeLock = false
//        
//        super.init(transitionStyle: .Scroll, navigationOrientation: orientation, options: nil)
//        
//        if self.numberOfPages > 0 {
//            if let initialContentViewController = contentViewControllerAtIndex(self.initialIndex) {
//                setViewControllers([initialContentViewController], direction: .Forward, animated: true, completion: nil)
//            }
//        }
//    }
//    
//    //MARK: View lifecycle
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//    
//        // This will save the last index shown when the view disappears
//        initialIndex = currentIndex
//    }
//    
//    //MARK: Abstract Methods
//    
//    func contentViewControllerTypeForIndex(index: UInt) -> T.Type? {
//        return nil
//    }
//    
//    func contentViewControllerObjectForIndex(index: UInt) -> Any? {
//        return nil
//    }
//    
//    func pageViewControllerWillSetContentViewController(contentViewController: T) {
//        
//    }
//    
//    func pageViewDidSwipe() {
//        // Set the controller so that any objects observing this keypath get properly notified.
//        currentContentViewController = viewControllers[0] as? T
//    }
//    
//    //MARK: Logic
//    
//    func isValidIndex(index: UInt) -> Bool {
//        return numberOfPages >= 0 || index < numberOfPages
//    }
//    
//    /**
//    *  Method to jump to a certain page in the page view controller. Solution
//    *  courtesy of http://stackoverflow.com/questions/13633059/uipageviewcontroller-how-do-i-correctly-jump-to-a-specific-page-without-messing
//    *
//    *  @param pageNumber The page number to jump to.
//    *  @param direction  The dirrection of the jump.
//    *  @param animated   Wether the jump is animated or not.
//    */
//    func swipeToIndex(index: UInt, withDirection direction: UIPageViewControllerNavigationDirection, animated: Bool) {
//        let contentViewController = contentViewControllerAtIndex(index)
//        
//        var neighbourContentController: UIViewController!
//        if direction == .Forward {
//            neighbourContentController = dataSource.pageViewController(self, viewControllerBeforeViewController: contentViewController)
//        } else {
//            neighbourContentController = dataSource.pageViewController(self, viewControllerAfterViewController: contentViewController)
//        }
//        
//        if let neighbourController = neighbourContentController {
//            var viewControllers = NSArray(array: [neighbourController])
//            setViewControllers(viewControllers, direction: direction, animated: false) { [weak self] (finished: Bool) in
//                
//                if finished {
//                    //FIXME: Warning Swift: re-defining wtf since 2014.
////                    self?.setViewControllers([contentViewController], direction: direction, animated: animated, completion: nil)
//                }
//            }
//        }
//    }
//    
//    func swipeToIndex(index: UInt, animated: Bool) {
//        if !isValidIndex(index) || index == currentIndex {
//            return
//        }
//        
//        var direction: UIPageViewControllerNavigationDirection = .Forward
//        if currentIndex > index {
//            direction = .Reverse
//        }
//        
//        swipeToIndex(index, withDirection: direction, animated: animated)
//        
//        pageViewDidSwipe()
//    }
//    
//    func contentViewControllerAtIndex(index: UInt) -> T? {
//        if !isValidIndex(index) {
//            return nil
//        }
//        
//        let contentObject = contentViewControllerObjectForIndex(index)
//        let type = contentViewControllerTypeForIndex(index)
//        
//        let contentViewController = type?()
//        contentViewController!.object = contentObject
//        contentViewController!.pageNumber = index
//        
//        if let controller = contentViewController {
//            controller.didUpdateContentObject()
//            pageViewControllerWillSetContentViewController(controller)
//        }
//        
//        return contentViewController
//    }
//    
//    //MARK: Page View Controller Data Source
//    
//    func pageViewController(pageViewController: UIPageViewController!, viewControllerBeforeViewController viewController: UIViewController!) -> UIViewController! {
//        let contentViewController = viewController as T
//        var index = contentViewController.pageNumber
//        
//        if !isValidIndex(index) {
//            return nil
//        }
//        --index
//        
//        return contentViewControllerAtIndex(index)
//    }
//    
//    func pageViewController(pageViewController: UIPageViewController!, viewControllerAfterViewController viewController: UIViewController!) -> UIViewController! {
//        let contentViewController = viewController as T
//        var index = contentViewController.pageNumber
//        
//        ++index
//        if !isValidIndex(index) {
//            return nil
//        }
//        
//        return contentViewControllerAtIndex(index)
//    }
//    
//    //MARK: Page View Controller Delegate
//    
//    func pageViewController(pageViewController: UIPageViewController!, didFinishAnimating finished: Bool, previousViewControllers: [AnyObject]!, transitionCompleted completed: Bool) {
//        if completed {
//            pageViewDidSwipe()
//        }
//    }
//}
