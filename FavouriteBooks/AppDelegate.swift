//
//  AppDelegate.swift
//  FavouriteBooks
//
//  Created by Tekla Matcharashvili on 29.10.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let navigationController = UINavigationController(rootViewController: MainViewController())
        
        window?.rootViewController = navigationController
        
        return true
    }
}
