//
//  ViewController.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 13/9/2022.
//

import UIKit

class HomeViewController: UIViewController {

    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView  = UIStackView()
    let scanButton = UIButton()
    
    var headerViewTopConstraint: NSLayoutConstraint?
    
    struct ScanButtonSpacing {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    let tiles  = [
        RewardsTileViewController(),
        TileViewController(
            title: "Fast Food is Good Food",
            subtitle: "I always like our native food that we cook everyday.Rice and Fish, Meat along with veg and lentils are my favourite. Thank you for reading :)",
            imageName: "meatless"
        ),
        TileViewController(
            title: "Fast Food is Good Food",
            subtitle: "I always like our native food that we cook everyday.Rice and Fish, Meat along with veg and lentils are my favourite. Thank you for reading :)",
            imageName: "communities"
        ),
        TileViewController(
            title: "Fast Food is Good Food",
            subtitle: "I always like our native food that we cook everyday.Rice and Fish, Meat along with veg and lentils are my favourite. Thank you for reading :)",
            imageName: "bonus"
        )
//        PlaceholderVc("Star Balance"),
//        PlaceholderVc("Bonas Stars"),
//        PlaceholderVc("Try These"),
//        PlaceholderVc("Welcome Back"),
//        PlaceholderVc("Uplifting")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        style()
        layout()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }

}

extension HomeViewController {
    
    func style() {
        view.backgroundColor = .backgroundWhite
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints  = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height / 2
    }
    
    func layout() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        view.addSubview(scanButton)
        
        for tile in tiles {
            self.addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        self.headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        NSLayoutConstraint.activate([
            self.headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //ScrollView
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            //StackView
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            //Scan button layout
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height)
        ])
        
    }
    
}


extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        let swipingDown = y <= 0
        let shouldSnap  = y > 30
        let labelHeight = self.headerView.greeting.frame.height + 16
        
        UIView.animate(withDuration: 0.3) {
            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
            self.view.layoutIfNeeded()
        } completion: { position in
            
        }
        
    }
}
