//
//  TileView.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 14/9/2022.
//

import UIKit

class TileView: UIView {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let ctaButton = makeGreenButton(withText: "Order")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 6
    private var fillColor: UIColor   = .white
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }
    
    func addShadow() {
        shadowLayer = CAShapeLayer()
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0, height: 1)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 1
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
}

extension TileView {
    
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
       // imageView.image = UIImage(named: "meatless")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.textColor = .label
       // titleLabel.text = "Fast Food is Good Food"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.lineBreakMode = .byWordWrapping
      //  subtitleLabel.text = "I always like our native food that we cook everyday.Rice and Fish, Meat along with veg and lentils are my favourite. Thank you for reading :) "
        
        ctaButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(ctaButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //TitleLabel
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //SubtitleLabel
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            //ctaButton
            ctaButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            ctaButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            ctaButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }
    
}
