//
//  BalanceView.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 15/9/2022.
//

import UIKit

class BalanceView: UIView {

    let pointsLabel = UILabel()
    let starView   = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BalanceView {
    
    func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        pointsLabel.text = "12"
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Star Balance"
    }
    
    func layout() {
        addSubview(pointsLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: 2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
