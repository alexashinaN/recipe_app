//
//  CollectionViewCell.swift
//  MyTestProject
//
//  Created by Violence on 02.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
	private let imageView = UIImageView()
	private let nameLabel = UILabel()
	
	var menu: RecipeModel? {
		didSet {
			nameLabel.text = menu?.productName
			contentView.backgroundColor = menu?.color
			if let image = menu?.productImage {
				imageView.image = UIImage(named: image)
			}
		}
	}
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configure()
		self.setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configure, Layout

private extension CollectionViewCell {
	func configure() {
		nameLabel.numberOfLines = 0
		nameLabel.textAlignment = .left
		nameLabel.lineBreakMode = .byWordWrapping
		nameLabel.textColor = .white
		nameLabel.font = .boldSystemFont(ofSize: 15)
	}
	
	func setupLayout() {
		contentView.addSubviews(imageView, nameLabel)
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			imageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.height),
			imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			
			nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 6),
			nameLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
			nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
		])
	}
}
