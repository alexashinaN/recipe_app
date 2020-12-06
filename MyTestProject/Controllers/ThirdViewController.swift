//
//  ThirdViewController.swift
//  MyTestProject
//
//  Created by Violence on 01.12.2020.
//  Copyright © 2020 Violence. All rights reserved.
//

import UIKit

final class ThirdViewController: UIViewController {
	// MARK: - Private
	
	private let cartImage = UIImageView(image: UIImage(named: "cart"))
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

private extension ThirdViewController {
	func configure() {
		navigationItem.title = "СПИСОК ПОКУПОК"
		view.backgroundColor = .white
		
		label.text = "Ваша корзина пока пуста. Добавьте сюда необходимые продукты."
		label.textColor = .gray
		label.numberOfLines = 0
		label.textAlignment = .center
		label.lineBreakMode = .byWordWrapping
		label.font = .systemFont(ofSize: 14)
	}
	
	func setupLayout() {
		view.addSubviews(cartImage, label)
		
		NSLayoutConstraint.activate([
			cartImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cartImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			cartImage.widthAnchor.constraint(equalToConstant: 70),
			cartImage.heightAnchor.constraint(equalToConstant: 70),
			
			label.topAnchor.constraint(equalTo: cartImage.bottomAnchor, constant: 10),
			view.rightAnchor.constraint(equalTo: label.rightAnchor, constant: 20),
			label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
		])
	}
}
