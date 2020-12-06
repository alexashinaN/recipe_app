//
//  AppDelegate.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let firstVC = ViewController()
		let secondVC = SecondViewController()
		let thirdVC = ThirdViewController()
		let fourthVC = FourthViewController()
		let fifthVC = FifthViewController()
		
		let firstNavController = UINavigationController(rootViewController: firstVC)
		let secondNavController = UINavigationController(rootViewController: secondVC)
		let thirdNavController = UINavigationController(rootViewController: thirdVC)
		let fourthNavController = UINavigationController(rootViewController: fourthVC)
		let fifthNavController = UINavigationController(rootViewController: fifthVC)
		firstNavController.tabBarItem = UITabBarItem(title: "Live", image: UIImage(named: "address"), tag: 0)
		secondNavController.tabBarItem = UITabBarItem(title: "Рецепты", image: UIImage(named: "phone"), tag: 1)
		thirdNavController.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(named: "basket"), tag: 2)
		fourthNavController.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "favourite"), tag: 3)
		fifthNavController.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(named: "user"), tag: 4)
		firstNavController.navigationBar.barTintColor = .black
		firstNavController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		secondNavController.navigationBar.barTintColor = .black
		secondNavController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		thirdNavController.navigationBar.barTintColor = .black
		thirdNavController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		fourthNavController.navigationBar.barTintColor = .black
		fourthNavController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		fifthNavController.navigationBar.barTintColor = .black
		fifthNavController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		
		
		let tabBarVC = UITabBarController()
		tabBarVC.setViewControllers([firstNavController, secondNavController, thirdNavController, fourthNavController, fifthNavController], animated: true)
		
		
		window?.rootViewController = tabBarVC
		window?.makeKeyAndVisible()
		
		return true

	}
	

}

extension UINavigationController {
	open override var childForStatusBarStyle: UIViewController? {
		return topViewController
	}
}
