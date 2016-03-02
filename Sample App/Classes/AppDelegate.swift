//
//  AppDelegate.swift
//  Sample App
//
//  Created by Émile Bélair on 16-03-01.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var viewController: ViewController?
    
    let dataSource = DataSource()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        viewController = ViewController(dataSource: dataSource)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = UIColor.blackColor()
        window!.rootViewController = viewController!
        window!.makeKeyAndVisible()
        
        return true
    }
}
