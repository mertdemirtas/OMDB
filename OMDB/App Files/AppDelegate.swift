//
//  AppDelegate.swift
//  OMDB
//
//  Created by Mert Demirtaş on 22.09.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        self.window = UIWindow()
        let vc = SplashScreenBuilder.build()
   //     let navigationController = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = vc
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        return true
    }
}

