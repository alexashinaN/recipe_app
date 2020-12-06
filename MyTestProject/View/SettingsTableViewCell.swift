//
//  SettingsTableViewCell.swift
//  MyTestProject
//
//  Created by Violence on 04.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
	
	private let mainLabel = UILabel()
	private let detailLabel = UILabel()
	
	var menu: RecipeModel? {
		didSet {
			mainLabel.text = menu?.productName
			contentView.backgroundColor = menu?.color
			detailLabel.text = menu?.recipeCountLabel
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

private extension SettingsTableViewCell {
	func configure() {
		mainLabel.numberOfLines = 0
		mainLabel.textAlignment = .left
		mainLabel.lineBreakMode = .byWordWrapping
		mainLabel.textColor = .white
		mainLabel.font = .boldSystemFont(ofSize: 15)
		detailLabel.numberOfLines = 0
		detailLabel.textAlignment = .right
		detailLabel.lineBreakMode = .byWordWrapping
		detailLabel.textColor = .white
		detailLabel.font = .systemFont(ofSize: 10)
	}
	
	func setupLayout() {
		contentView.addSubviews(mainLabel, detailLabel)
		
		NSLayoutConstraint.activate([
			mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			mainLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
			
			detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			contentView.rightAnchor.constraint(equalTo: detailLabel.rightAnchor, constant: 5)
		])
	}
}
