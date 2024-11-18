//
//  ExploreContentCell.swift
//  ANF Code Test
//
//  Created by Jian Ma on 11/17/24.
//

import UIKit
import Combine

class ExploreContentCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var topDescLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var promoMessageLabel: UILabel!
    @IBOutlet weak var bottomDescLabel: UILabel!
    @IBOutlet weak var contentStackView: UIStackView!
    private var cancellable: AnyCancellable?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() } // Clear buttons before reuse
        backgroundImageView.image = nil
    }
    
    func setUp() {
        // Background Image
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        // Top Description Label
        topDescLabel.font = UIFont.systemFont(ofSize: 13)
        topDescLabel.numberOfLines = 0
        
        // Title Label
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        
        // Promo Message Label
        promoMessageLabel.font = UIFont.systemFont(ofSize: 11)
        promoMessageLabel.numberOfLines = 0
        promoMessageLabel.textColor = .red // Example color for promo emphasis
        
        // Bottom Description Label
        bottomDescLabel.font = .systemFont(ofSize: 13)
        bottomDescLabel.numberOfLines = 0
        
        // Content Stack View
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.distribution = .fillEqually
        contentStackView.alignment = .leading
    }
    
//    func configure(with data: ExploreCellData, viewModel: ExploreViewModel) {
//        titleLabel.text = data.title
//        
//        cancellable = viewModel.fetchImage(from: data.backgroundImage)
//            .sink { [weak self] image in
//                self?.backgroundImageView.image = image
//            }
//    }
}

