//
//  HomeHeaderView.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 13/9/2022.
//

import UIKit

class HomeHeaderView: UIView {

    let greeting = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeHeaderView {
    
    func style() {
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good Afternoon, Saleh Masum"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            greeting.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            greeting.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            inboxButton.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 16),
            inboxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inboxButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
    }
}

extension HomeHeaderView {
    func makeInboxButton() {
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "envelope", withConfiguration: configuration)
        inboxButton.setImage(image, for: .normal)
        inboxButton.setTitle("Inbox", for: .normal)
        inboxButton.setTitleColor(.secondaryLabel, for: .normal)
        inboxButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        inboxButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       // inboxButton.backgroundColor = .systemTeal
    }
}
