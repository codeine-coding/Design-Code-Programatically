//
//  MainTabBarController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.title = "Home"
        homeViewController.tabBarItem.selectedImage = UIImage(named: "Tab Bar/home-active")
        homeViewController.tabBarItem.image = UIImage(named: "Tab Bar/home")
        
        let chaptersVC = UINavigationController(rootViewController: ChaptersViewController())
        chaptersVC.title = "Chapters"
        chaptersVC.tabBarItem.selectedImage = UIImage(named: "Tab Bar/chapters-active")
        chaptersVC.tabBarItem.image = UIImage(named: "Tab Bar/chapters")
        
        let bookmarksVC = UINavigationController(rootViewController: BookmarksTableViewController())
        bookmarksVC.title = "Bookmarks"
        bookmarksVC.tabBarItem.selectedImage = UIImage(named: "Tab Bar/bookmarks-active")
        bookmarksVC.tabBarItem.image = UIImage(named: "Tab Bar/bookmarks")
        
        let exercisesVC = ExercisesTableViewController()
        exercisesVC.title = "Exercises"
        exercisesVC.tabBarItem.selectedImage = UIImage(named: "Tab Bar/exercises-active")
        exercisesVC.tabBarItem.image = UIImage(named: "Tab Bar/exercises")
        
        let moreVC = MoreViewController()
        moreVC.title = "More"
        moreVC.tabBarItem.selectedImage = UIImage(named: "Tab Bar/more-active")
        moreVC.tabBarItem.image = UIImage(named: "Tab Bar/more")
        
        
        self.viewControllers = [
            homeViewController,
            chaptersVC,
            bookmarksVC,
            exercisesVC,
            moreVC
        ]
        self.selectedIndex = 0
        self.delegate = self as? UITabBarControllerDelegate
        self.tabBar.isTranslucent = false
    }

}
