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
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        topDescLabel.font = UIFont.systemFont(ofSize: 13)
        topDescLabel.numberOfLines = 0
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.numberOfLines = 0
        
        promoMessageLabel.font = UIFont.systemFont(ofSize: 11)
        promoMessageLabel.numberOfLines = 0
        
        bottomDescLabel.font = .systemFont(ofSize: 13)
        bottomDescLabel.numberOfLines = 0
        
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.distribution = .fillEqually
        contentStackView.alignment = .leading
    }
    
    func configure(with data: ExploreCellData) {
        topDescLabel.text = data.topDescription
        titleLabel.text = data.title
        promoMessageLabel.text = data.promoMessage
        bottomDescLabel.text = data.bottomDescription
        
        if let imageUrl = URL(string: data.backgroundImage) {
            loadImage(from: imageUrl)
        }
        
        for item in data.content {
            let button = createContentButton(for: item)
            contentStackView.addArrangedSubview(button)
        }
    }
    
    private func createContentButton(for contentItem: ExploreCellData.Content) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(contentItem.title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .leading
        
        button.addAction(UIAction { _ in
            if let url = URL(string: contentItem.target) {
                UIApplication.shared.open(url)
            }
        }, for: .touchUpInside)
        
        return button
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.backgroundImageView.image = image
                }
            }
        }.resume()
    }
}

