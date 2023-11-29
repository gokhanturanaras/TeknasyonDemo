//
//  AppDelegate.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController(rootViewController: MainViewController())
        let barAppearance = UINavigationBar.appearance()
        barAppearance.barTintColor = .background
        barAppearance.tintColor = .background
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav1.navigationBar.isTranslucent = false
        nav1.navigationBar.backgroundColor = .background
        nav1.navigationBar.barTintColor = .background
        nav1.navigationBar.tintColor = .white
        self.window?.rootViewController = nav1
        self.window?.makeKeyAndVisible()
        return true
    }


}

