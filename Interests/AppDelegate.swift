//
//  AppDelegate.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func xxx() {
        
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.backgroundColor = UIColor(hex: "f2f2f2")
        
        // register Parse PFObject subclass
        TestObject.initialize()
        
        Parse.setApplicationId("AmRHj24hoCSWOWlL1mop5RbpWniM0a5caWfoB4X8", clientKey: "sStjfFINjlJ78mvKHxwHs7ONYmZ3ZfZgFGKojDyN")
        
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        let testObject = TestObject()
        testObject.title = "object1"
        testObject.objectDescription = "ddddssxc"
        testObject.numbers = 11
        testObject.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                print("success")
            }
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

// MARK: end AppDelegate -

