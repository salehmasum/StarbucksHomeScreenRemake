//
//  RewardView.swift
//  StarbucksHomeScreenRemake
//
//  Created by Saleh Masum on 15/9/2022.
//

import UIKit

class RewardTileView: UIView {
    
    let balanceView = BalanceView()
    var rewardsOptionButton = UIButton()
    let rewardsGraphView = RewardsGraphView()
    let starRewardsView  = StarRewardsView()
    var detailsButton   = UIButton()
    
    var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension RewardTileView {
    
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        
        rewardsGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardsOptionButton()
        detailsButton = makeClearButton(withText: "Details")
        
       // rewardsGraphView.backgroundColor = .systemRed
        
    }
    
    func makeRewardsOptionButton() {
        rewardsOptionButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsOptionButton.addTarget(self, action: #selector(rewardOptionButtonTapped), for: .primaryActionTriggered)
        
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        
        rewardsOptionButton.setImage(image, for: .normal)
        rewardsOptionButton.imageView?.tintColor = .label
        rewardsOptionButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsOptionButton.setTitle("Rewards options", for: .normal)
        rewardsOptionButton.setTitleColor(.label, for: .normal)
        rewardsOptionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsOptionButton.semanticContentAttribute = .forceRightToLeft
        rewardsOptionButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 20, bottom: 0, right: 0)
       // rewardsOptionButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func layout() {
        addSubview(balanceView)
        addSubview(rewardsOptionButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
        
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             //reward option button
            rewardsOptionButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            rewardsOptionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            //reward graph view
            rewardsGraphView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 8),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardsGraphView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            rewardsGraphView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //star rewards view
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            starRewardsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            heightConstraint!,
            //detail button
            detailsButton.topAnchor.constraint(equalTo: starRewardsView.bottomAnchor, constant: 16),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            detailsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
        ])
        
        starRewardsView.isHidden = true
    }
    
    //Redraw our graph once we know our actual device width & height
    override func layoutSubviews() {
        super.layoutSubviews()
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}


// MARK: Actions
extension RewardTileView {
    @objc func rewardOptionButtonTapped() {
        
        if heightConstraint?.constant == 0 {
            self.setChevronUp()

            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 270
                self.layoutIfNeeded()
            }
            heightAnimator.startAnimation()

            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            alphaAnimator.startAnimation(afterDelay: 0.5)

        } else {
            self.setChevronDown()

            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }

    @objc func detailsButtonTapped() {
        print("Details tapped!!!")
    }

    private func setChevronUp() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.up", withConfiguration: configuration)
        rewardsOptionButton.setImage(image, for: .normal)
    }

    private func setChevronDown() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        rewardsOptionButton.setImage(image, for: .normal)
    }
}
