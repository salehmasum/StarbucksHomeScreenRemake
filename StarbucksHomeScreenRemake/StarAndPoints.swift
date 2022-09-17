//
//  StarAndPoints.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 16/9/2022.
//

import UIKit

class StarAndPoints: UIView {

    let pointsLabel = UILabel()
    let starView   = makeSymbolImageView(systemName: "star.fill", scale: .small)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font  = UIFont.preferredFont(forTextStyle: .callout)
        pointsLabel.textAlignment = .right
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
    }
    
    func layout() {
        addSubview(pointsLabel)
        addSubview(starView)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor,constant: 2),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor),
            starView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 60, height: 16)
    }
    
}
