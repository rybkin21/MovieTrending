//
//  AppDelegate.swift
//  MovieTrending
//
//  Created by Ivan Rybkin on 10.10.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigatorController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigatorController
        window.makeKeyAndVisible()

        self.window = window
        return true
    }

}

