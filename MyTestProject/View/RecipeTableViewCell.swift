//
//  RecipeTableViewCell.swift
//  MyTestProject
//
//  Created by Violence on 02.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class RecipeTableViewCell: UITableViewCell {
	private let mealImageView = UIImageView()
	private let nameLabel = UILabel()
	private let recipeCount = UILabel()
	private let labelView = UIView()
	
	var menu: RecipeModel? {
		didSet {
			nameLabel.text = menu?.productName
			contentView.backgroundColor = menu?.color
			recipeCount.text = menu?.recipeCountLabel
			if let image = menu?.productImage {
				mealImageView.image = UIImage(named: image)
			}
		}
	}
	
	// MARK: - Init
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configure()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configure, Layout

private extension RecipeTableViewCell {
	func configure() {
		nameLabel.numberOfLines = 0
		nameLabel.textAlignment = .left
		nameLabel.lineBreakMode = .byWordWrapping
		nameLabel.textColor = .white
		nameLabel.font = .boldSystemFont(ofSize: 15)
		recipeCount.numberOfLines = 0
		recipeCount.textAlignment = .center
		recipeCount.lineBreakMode = .byWordWrapping
		recipeCount.textColor = .white
		recipeCount.font = .systemFont(ofSize: 10)
		mealImageView.contentMode = .scaleToFill
		labelView.backgroundColor = .systemGray
	}
	
	func setupLayout() {
		contentView.addSubviews(mealImageView, nameLabel, labelView)
		labelView.addSubviews(recipeCount)
		
		NSLayoutConstraint.activate([
			mealImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.0),
			mealImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -2.0),
			mealImageView.widthAnchor.constraint(equalToConstant: 100.0),
			mealImageView.heightAnchor.constraint(equalToConstant: 100.0),
			mealImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2.0),
			
			nameLabel.leftAnchor.constraint(equalTo: mealImageView.rightAnchor, constant: 10),
			nameLabel.centerYAnchor.constraint(equalTo: mealImageView.centerYAnchor, constant: -10),
			nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			
			labelView.leftAnchor.constraint(equalTo: mealImageView.rightAnchor, constant: 2),
			labelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2.0),
			labelView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			labelView.heightAnchor.constraint(equalToConstant: 20),
			
			recipeCount.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
			recipeCount.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
		])
	}
}
