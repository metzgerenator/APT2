//
//  TabViewController.swift
//  APT2
//
//  Created by Tiesha on 6/19/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit


class TabViewController: UIViewController {




    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    
    var listsViewController: UIViewController!
    
    var addViewController: UIViewController!
    
    var mapsViewController: UIViewController!
    
    var profileViewController: UIViewController!
    
    
    var viewControllers: [UIViewController]!


    var selectedIndex: Int = 0
    



    
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeVC")

        
        
        listsViewController = storyboard.instantiateViewControllerWithIdentifier("ListsVC")
        
        addViewController = storyboard.instantiateViewControllerWithIdentifier("AddVC")
        
        
        
        mapsViewController = storyboard.instantiateViewControllerWithIdentifier("MapsVC")
        
        profileViewController = storyboard.instantiateViewControllerWithIdentifier("profileVC")
        
        
        
        viewControllers = [homeViewController, listsViewController, addViewController, mapsViewController, profileViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        

    }
    
    
    @IBAction func didPressTab(sender: UIButton) {
        
        //get access to previous and current tab button
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        //remove previous view controller and set button state
        
        buttons[previousIndex].selected = false
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        
        // add new view controller and set button state
        
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
        
        
        
        
    }
    
    
    
    




}