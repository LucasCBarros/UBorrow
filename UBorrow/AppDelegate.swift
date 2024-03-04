//
//  AppDelegate.swift
//  UBorrow
//
//  Created by Lucas Barros on 08/01/18.
//  Copyright © 2018 Lucas C Barros. All rights reserved.
//

import UIKit
import StoreKit
import IQKeyboardManagerSwift // Keyboard autoScroll PodFile

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Keyboard autoScroll PodFile Activate
        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.sharedManager().enable = true
        
        if(UserDefaults.standard.integer(forKey: "objectCounter") > 0) {
            businessControll.retrieveObjectData()
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func requestReview(){
        if #available(iOS 10.3, *){
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            let warningMessage = ConfigViewController()
            warningMessage.callWarning(popupTitle: "Ops..", popupMessage: "Sorry, but your iOS version can't make a review by the app. We would love for you to rate us in the AppSore!")
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // setting a value for a key
        businessControll.saveObjectData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        // setting a value for a key
        businessControll.saveObjectData()
    }


}

