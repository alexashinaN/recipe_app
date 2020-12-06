//
//  FourthViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class FourthViewController: UIViewController {
	
	// MARK: - Private
	
	private let favImage = UIImageView(image: UIImage(named: "heart"))
	private let label = UILabel()
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		setupLayout()
	}
	
	// MARK: - Override
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return .lightContent
	}
}

// MARK: - Configure, Layout

private extension FourthViewController {
	func configure() {
		navigationItem.title = "ЛЮБИМЫЕ РЕЦЕПТЫ"
		view.backgroundColor = .white
		
		label.text = "Мы заметили, что Вы часто готовите одни и те же блюда. Пора добавить свою любимую еду в раздел!"
		label.textColor = .gray
		label.numberOfLines = 0
		label.textAlignment = .center
		label.lineBreakMode = .byWordWrapping
		label.font = .systemFont(ofSize: 14)
	}
	
	func setupLayout() {
		view.addSubviews(favImage, label)
		
		NSLayoutConstraint.activate([
			favImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			favImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			favImage.widthAnchor.constraint(equalToConstant: 70),
			favImage.heightAnchor.constraint(equalToConstant: 70),
			
			label.topAnchor.constraint(equalTo: favImage.bottomAnchor, constant: 10),
			view.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 20),
			label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
		])
	}
}
