//
//  RewardsTileViewController.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 15/9/2022.
//

import UIKit

class RewardsTileViewController: UIViewController {

    let rewardsTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
    func style() {
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(rewardsTileView)
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
