//
//  MainTabBarController.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 13/9/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = ScanViewController()
        let vc3 = OrderViewController()
        let vc4 = GiftViewController()
        let vc5 = StoreViewController()
        
        //vc1.title = "Good Afternoon, Saleh"
        vc2.title = "Scan"
        vc3.title = "Order"
        vc4.title = "Gift"
        vc5.title = "Store"
        
       // vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        vc5.navigationItem.largeTitleDisplayMode = .always
        
       // let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
       // nav1.navigationBar.tintColor = .label
        //nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.tintColor = .label
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.tintColor = .label
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.tintColor = .label
        nav4.navigationBar.prefersLargeTitles = true
        nav5.navigationBar.tintColor = .label
        nav5.navigationBar.prefersLargeTitles = true
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "house.fill", withConfiguration: configuration)
        vc1.tabBarItem = UITabBarItem(title: "Home", image: image, tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Scan", image: UIImage(systemName: "qrcode"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "arrow.up.bin.fill"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Gift", image: UIImage(systemName: "gift.fill"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Store", image: UIImage(systemName: "location.fill"), tag: 5)
        
        
        setViewControllers([vc1, nav2, nav3, nav4, nav5], animated: true)
        
        tabBar.tintColor = .lightGreen
        tabBar.isTranslucent = false
    }
    
}
